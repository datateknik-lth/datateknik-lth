Misc
----
Amdahl's law

```
Speedup = 1 / ( (1-P) - P/N )

Where P is part of program that can be parallelized
```

`volatile` in java needed for compound atomicity (but not for assignment)

Three main issues
-----------------
1. Program correctness
2. Load-imbalance
3. Cache issues (tuning means exploiting them better)

Parallelization of a Sequential Application
-------------------------------------------
1. Decomposition:   dividing work inte parallel tasks
2. Assignment:      deciding which thread should do which tasks
3. Orchestration:   communication & syncrhonization between threads
    - Programming model (message passing vs shared memory)
    - How to organize data structures to reduce cache misses?
    - How to reduce the cost of communication and synchronization?
    - How to reduce serialization of access to shared data?
    - How to schedule tasks to satisfy dependencies early?
4. Mapping:         deciding which threads should run on which processors
    - Usually not done by the programmer, but the OS
    - If the programmer can specify on which processor it is called `pinning`
      it
    - Useful to have more threads than processors

> We want our program to have as many tasks as can be efficiently handled

Owner computes
--------------
Basic rule: *owner computes* (and modifies) other threads read.

Killing features for hardware companies
---------------------------------------
* Insufficient performance
* Requiring new programming languages
* Requiring nonstandard extension to C or FORTRAN
* taking too long to reach market so your technology becomes obsolete

Most important lessons from the past
------------------------------------
* Programmability and mass market are essential
* Amdahl's law is extremely important
* Cache coherent shared memory multiprocessors are here now and we must
* write general purpose applications in Java and C/C++ for them.
* It is essential to understand that all the fancy ideas have been around
* many decades and we should be sceptical when somebody tells us they have
* the ultimate solution for faster parallel machines.

John Cocke is considered the father of RISC

Need for consistency models
---------------------------
A memory consistency model is a set of rules which specify when a written value
by one thread can be read by another thread. Without these rules, it's
impossible to write a correct parallel program. The model also affects which
programmer/compiler optimizations are legal.

Lockup-free cache
-----------------
A lockup-free cache can reorder memory accesses. I.e. when a cache miss
occurs, the processor can service other cache accesses.

Also known as *non-blocking cache*, data prefetching require the cache to be
lockup-free -- otherwise the processor would be stalled and the prefetching
would be rather pointles..

Write buffer bypassing
----------------------
*We want our reads to be serviced as quickly as possible*. Between L1 and
L2 caches, there is a buffer (first level write buffer). A second write
buffer is located between L2 and the bus interface.

By letting read misses bypass writes in the buffer to other addresses, the
reads can be serviced faster.

**Such bypasses reorder the memory accesses**

Sequential Consistency
----------------------
* Published by Leslie Lamport 1979
* Neither Java, Pthreads, C11/C++ require it. They work on relax memory models
* Can be seen from a programmers perspective as if the multiprocessor has no
  cache memories and all memory accesses are go to memory, which is done
  atomically
* All memory acceses can be seen as atomic

Lamport's definition:
> *A multiprocessor system is sequentially consistent if
> the result of any execution is the same as if the operations of all the
> processors were executed in some sequential order, and the operations of each
> individual processor appear in this sequence in the order specified by its
> program.*


*Dekker's algorithm* only works with SC. Read bypass destroys the atomicity and
hence the sequential order. Optimizing compilers are also allowed to assume
that the flag variables are not modified, and as such constant value
propagation will ruin it as well.

Other things that ruin SC include:

* Overlapping writes (T1 has to finish its write to var A before T2 uses it
  etc)
* Nonblocking reads: because of speculative execution, a read from `a` might
  occur before the `while`-loop.

```c
//called by T1
void v(void)
{
    a = u();
    f = 1;
}

//called by T2
void w(void)
{
    while (!f);
    printf("a = %d\n", a);
}
```

Cache coherence protocols
-------------------------
1. At a write, the cache coherence protocol should either remove all other
   copies, including the memory copy, or send the newly written data to
   update each copy.
      - The first is called *write invalidate*
      - The latter is called *write update protocol*, is almost always better
2. Detecting when a write has completed so that the processor can perform the
   next memory access
3. Maintaining illusion of atomicity - with memory in multiple nodes the
   accesses can't be atomic, but a SC machine mus behave as if they are.

Memory access penalty
---------------------
Time CPU spends stalling due to waiting for the cache is called MAP. This
penalty is due to the fact that the processor cannot perform another memory
access before the previous has completed.

Weak Ordering
-------------
The memory consistency model introduced with the sync instruction. Assumes
shared data is modified in critical sections. CPU can pipeline the writes and
only wait at the end of the critical section.

Release Consistency
-------------------
Two different synchronization operations identified: an `acquire` at lock,
`release` at unlock.

Neither compiler nor CPU may order memory accesses issued after acquire to
before it. All acknowledged invalidations must be applied before acquire.

POSIX Thread Cancellation
-------------------------
1. Disabled     - waits until the thread to be canceled enables cancellation
2. Deferred     - the cancelation is started at the next cancellation point
3. Asynchronous - cacnellation can start at any time

Cancellation points:
* `pthread_cond_wait`
* `pthread_testcancel`
* `pthread_cond_timedwait`
* `pthread_join`
* `close`
* `open`
* `system`
* `waitpid`
* `creat`
* `read`
* `wait`
* `write`
* `printf`
* `fopen`
* `scanf`
* `fclose`

Write code like this:

```c
pthread_mutex_lock(&mutex);
while (!predicate())
    pthread_cond_wait(&cond, &mutex); // releases the mutex, gets it on wake

/* do stuff */
pthread_mutex_unlock(&mutex);
```

Intercepted Wakeups
-------------------
A thread other than the one you wake, takes the mutex. I.e. if you unlock first
and then wake. Because of this, the predicate needs to be checked in a loop
(like the above example).

Loose Predicates
----------------
If the waking thread has to determine if its predicate is true then you've
woken it on the pretense that there *might* be something of interest to it.
This is called a loose predicate.

Spurious Wakeups
----------------
When a waiting thread is woken unnecessarily. E.g. when the process receives a
UNIX signal such as `SIGKILL`.

These three are the reason a loop is needed to check the predicate.

Using Atomic Objects In C11
---------------------------
* Modifying an atomic type does not require a lock
* Members of a struct may *NOT* be modified individually, the struct must first
  be copied to a non-atomic variable of compatible type
* De- and increment operations as well as compound assignment operators (e.g.
  `+=`) are atomic read-modify-write operations
* Size of atomic and non-atomic compatible types are typically different
* Memory ordering when using these operators is sequential consistency

Atomic Flag
-----------
The type `atomic_flag` is a lock-free struct. Other tpes such as `atomic_char`
might be implemented with locks.

There are macros to evaluate whether they are lock-free or not. If
`ATOMIC_INT_LOCK_FREE` is true, then it is true for both signed and unsigned
integers.

Initializing Atomics
--------------------
The initialization itself is *NOT* atomic! Either use `ATOMIC_VAR_INIT(val)` or
`void atomic_init(volatile A* ptr, C val)`.

Weak Compare and Exchange Functions
-----------------------------------
* The weak compare and exchange may fail and give up. If so, they return `false`
* Thus, they have to be used in a loop
* Weak form allows for faster implementation on machines with
  load-locked/load-linked/load-and-reserve and store conditional instructions --
  instead of atomic compare and exchange
* If a processor, `P1`, performs a load-locked and then a store conditional -
  but a different processor, `P2`, performs a store between the load-locked and
  the store conditional then `P1`'s store conditional fails.

Atomic Flag
-----------
* Atomic flag type operations are the minimal hardware supporte atomic
  operations
* All others *can* be implemented using these, but better performance can be
  achieved with more hardware support

Synchronization using fences
----------------------------

```c
/* Thread 1 */
atomic_int_t    m;
int             u;

u = 1;
atomic_thread_fence(memory_order_release);
atomic_store_explicit(&m, u, memory_order_relaxed);

/* Thread 2 */
u = atomic_load_explicit(&m, memory_order_relaxed);
atomic_thread_fence(memory_order_acquire);
printf("u = %d\n", u);
```

One thread releases, the other consumes.

> **Intra-thread**
> Inside thread

> **Inter-thread**
> Between threads

Read-copy Update
----------------
* Pointers to data protected by RCU
* Readers use read-side critical sections marked by enter & exit
* When a reader is in such a setion, a writer may not modify the data structure:
  instead modifies a copy
* When the last reader has left the original data is modified

Dependencies and Compiler Optimization
--------------------------------------
When a compiler uses constant propagation, dependencies have to be accounted
for before any optimization and preserved afterwards. Example

```c
// Original code
i = atomic_load(q, memory_order_consume);
a = b[i % size];

// Compiler deduces that size == 1 and optimizes to
i = atomic_load(q, memory_order_consume);
a = *b;
```

There is now no dependency between `i` and `a` - as such they may be reordered,
which is not what the programmer intended.

Preserving the dependency here simply means to let the hardware know about it.
As such the compiler may choose different instructions.

Programmers should also be careful of the following:

```c
a = atomic_load(p, memory_order_consume); // X
atomic_store(q, a, memory_order_relaxed); // Y
atomic_store(r, b, memory_order_relaxed); // Z
```

Since `Z` has no relation to `X` they may be reordered.

Power Memory Barrier Instructions
---------------------------------

### hwsync ###
* A-set consists of all instructions preceding `hwsync`, B-set consists
  of all memory access instructions following
* No B-set instruction may be reordered with any A-set instruction
* Used to implement SC write on Power

### lwsync ###
* A- and B-set contain all memory access instructions preceding and following
  `lwsync`.
* Allows reordering of some instructions between the sets
    - A-side store and B-side load are not ordered
* For a store before a load, separated by a lwsync, the barrier will ensure
  that the store is committed before the load is satisfied, but lets the load be
  satisfied before the store has been propagated to any other thread

### isync ###
*Fastest*, but allows stores to be performed if A-set instructions cache miss.
As such a `beq` instruction can be inserted since stores are not allowed to be
performed speculatively on Power.

### eieio ###
Enforce order of I/O, only orders stores

Cumulative Ordering
-------------------
* FUCKING DISASTER

Cell - Comparison with Data Prefetching
---------------------------------------
* Prefetching to avoid cache misses is not a universal solution, might be
  overwritten by other prefetching
* Since Cell offers complete control of LS, you can avoid overwriting useful
  data simply by using different local store addresses
* Processor can continue with other work while the MFC performs the data
  transfer
* The SPU will not automatically wait for data. You can tell the SPU to wait
  until a subset of all pending DMA operations have completed. This is done by
  setting a bit corresponding to the tag you want to wait for
* You can have more than 32 pending operations if you wish

Cell - mailboxes
----------------
* Alternative to DMA for small amounts of data
* Each SPU has three mailboxes:
    - Outgoing (from the SPU)
    - Outgoing interrupt
    - Incoming (to the SPU)

Data depenencies
----------------
* True   - `I1` produces a value consumed by `I2`
* Anti   - `I1` reads something overwritten by `I2`
* Output - both write to the same variable
* Input  - both read the same

Cache misses
------------
* Compulsory - initial mandatory miss
* Capacity   - cache is full
* Conflict   - value is replaced
* Coherence  - true sharing and false sharing misses

Cache Aware Programming on Multicores
-------------------------------------
* Reduce communication - ideally each processor should work on its own data and
  no other processor should be involved
* Make sure each thread uses its own cache block
* Improve locality of data
* Bad idea to put multiple spin locks in an array, put pointers instead
* Cache block size usually not fixed for an architecture (Some Power CPUs use
  32 bytes while other use 128 bytes)
* Hard to prefetch lists and trees, easier if allocated in an arena
* Prefetching data we intend to modify may reduce write penalty and write
  traffic
* Hardware-based data prefetching works by processors discovering constant
  stride and then predicting which blocks will be required
