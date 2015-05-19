Terms
=====

* **Branch Prediction**

> Pipelined processors use speculative computing to be more efficient. This
> means that they will need to guess the outcome of a branch. This can be done
> with the help of a *Branch History Table*, where the results of the last
> branhces are stored. Without this optimization, instructions following the branch
> cannot be loaded until the outcome has been determined.

* **Rename Registers**

> Are used to eliminate *true depencies* (when the outcome of one instruction
> is dependent on another). the concerned hazards are write after read and write
> after write

* **Reorder buffer**

> The reorder buffer is used for *out-of-order execution*. It allows
> instructions to be committed in-order. I.e. instructions may be executed out
> of order but the result of the program, is the same as if it wasn't
> rearranged.

* **Direct mapped cache**
> In a direct map cache there's a function that maps the address to a
> particular row, so only one comparator is needed (`i = addr % CACHE_SIZE`).

* **Set associative cache**
> Maps address to set instead of row. I.e. a specific set will be searched for
> the wanted row. Done with comparators (see below).

* **Fully associative cache**
> Look through each row in the cache for the wanted address. Done with
> comparators, that execute the lookup in parallel. For real applications this
> is unfeasable since there would have to be too many comparators to fit on the
> chip.

* **Temporal locality**
> Objects are close in time, i.e. used near each other in time

* **Spatial locality**
> Objects are close to each other in memory. For best cache performance,
> objects that are used closely in time should be kept close spatially as
> well.

* **RISC**
> Reduced instruction set computer

* **Comparators**
> For each line in the cache set, they compare the address of the stored one
> with the requested address.

* **Block size**
> The number of bytes fetched when a cache miss occurs. To benefit from spatial
> locality, it should be at least 32 bytes. With a large block size, a miss
> might overwrite data that will be read next. I.e. few of the loaded bytes
> will be of use

Common questions
================

* Explain why a five-stage pipelined RISC processor usually does not see a
  five-time speedup when running most programs.
    - Pipeline stalls due to taken branches
    - Pipeline stalls due to sequences such as a load directly followed by use
      of the fetched value
    - Delay due to cache miss
    - Instructions such as divide taking multiple cycles to execute
* Describe a program that can come close to a five-time speedup
    - A program which does not suffer cache misses, and none of the other
      problems above, which sometimes can be achieved by loop-unrolling and many
      integer computations

Tools
=====

* **gcov**
> Counts exact execution counts for each source line as well as branch
> frequenceies (taken/non-taken). Needs special flags for the compilation and
> affects compiler optimization.

* **gprof**
> Execution times are shown for the different functions and the nmber of times
> each function is called and by which function. Same disadvantages as *gcov*

* **OProfile**
> Can count the number of times certain events happen such as: clock cycles,
> executed instructions cache misses. Can be presented at source code level or
> instruction level. Advantages over *gcov*/*gprof* are that it does not need
> special flags and should be used with the highest level of optimization. A
> disadvantage is that to change what it should count, the user must have root
> privileges on the machine

* **valgrind**
> Can detect many kinds of pointer and memory allocation errors. It can also
> produce statistics of heap memory usage and cache performance.  Doesn't
> require flags, but works best when debugging information is available. Is
> much slower than other tools (e.g. 100 times slower execution)

C
=

* `alloca`

> Macro for allocating on the stack used when the data size is reasonable and
> it isn't returned from the allocating function

* **Arenas**

> A chunk of memory allocated at once. Used instead of making many calls to
> `malloc`. When all the work is complete, the arena can be deallocated at
> once. This makes arenas useful when many calls to `free` occur at once.

* **Free-lists**

> If it happens often that objects of the same size are allocated and
> deallocated, they can be put in a free-list instead of deallocating them
> using `free`. If the objects are of different sizes or only deallocated near
> the end of an execution, free-lists are *not* useful.
