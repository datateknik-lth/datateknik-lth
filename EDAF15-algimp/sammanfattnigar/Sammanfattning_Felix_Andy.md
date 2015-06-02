Terms
=====

**Branch Prediction**
> Pipelined processors use speculative computing to be more efficient. This
> means that they will need to guess the outcome of a branch. This can be done
> with the help of a *Branch History Table*, where the results of the last
> branches are stored. Without this optimization, instructions following the branch
> cannot be loaded until the outcome has been determined.

**Rename Registers**
> Are used to eliminate *anti- and output dependencies*. The concerned hazards are write after read and write
> after write.

**Reorder buffer**
> The reorder buffer is used for *out-of-order execution*. It allows
> instructions to be committed in-order. I.e. instructions may be executed out
> of order but the result of the program, is the same as if it wasn't
> rearranged.

**Direct mapped cache**
> In a direct map cache there's a function that maps the address to a
> particular row, so only one comparator is needed (`i = addr % CACHE_SIZE`).

**Set associative cache**
> Maps address to set instead of row. I.e. a specific set will be searched for
> the wanted row. Done with comparators (see below).

**Fully associative cache**
> Look through each row in the cache for the wanted address. Done with
> comparators, that execute the lookup in parallel. For real applications this
> is unfeasible since there would have to a lot of comparators. The space can
> be utilized in a better way.

**Temporal locality**
> Objects are close in time, i.e. used near each other in time

**Spatial locality**
> Objects are close to each other in memory. For best cache performance,
> objects that are used closely in time should be kept close spatially as
> well.

**RISC**
> Reduced instruction set computer

**Comparators**
> For each line in the cache set, they compare the address of the stored one
> with the requested address.

**Block size**
> The number of bytes fetched when a cache miss occurs. To benefit from spatial
> locality, it should be at least 32 bytes. With a large block size, a miss
> might overwrite data that will be read next. I.e. few of the loaded bytes
> will be of use

**Arithmetic shift**
> When dividing value by a power of two, we can shift the numerator right same
> number of times as the order of the denominator (i.e. 4 times for 16 and 2
> times for 4). When this is done with negative integers we need to add one
> to the solution if the computed value is not a power of two.

**True dependence**
> An instruction `I_1`is followed by `I_2`. If `I_1` produces a value that
> `I_2` needs, then there is a true dependence between them. Stalls caused by
> these cannot be avoided by the processor.

**Anti dependence**
> `I_1` will read a value that a later instruction will overwrite. The latter
> needs to wait until it is safe to overwrite the value. Can be avoided with
> rename registers.

**Output dependence**
> Two instructions will overwrite a location and their writes must happen in
> that order. Can be avoided with rename registers.

**Input dependence**
> Two instructions will read the same location. This does not impact execution.

Common questions
================

**Explain why a five-stage pipelined RISC processor usually does not see a
five-time speedup when running most programs.**
> Pipeline stalls due to taken branches
> Pipeline stalls due to sequences such as a load directly followed by use
> of the fetched value
> Delay due to cache miss
> Instructions such as divide taking multiple cycles to execute

**Describe a program that can come close to a five-time speedup**
> A program which does not suffer cache misses, and none of the other
> problems above, which sometimes can be achieved by loop-unrolling and many
> integer computations

**How is chaos averted when using speculative execution? (I.e. that a register
or memory location is modified only if it should be)**
> The CPU will fetch the instructions for the guessed outcome of the
> branch. But it is not allowed to modify memory until it knows for certain
> that the branch was taken. If it was incorrect the instructions fetched
> are simply ignored and the correct instructions are fetched. It uses
> *register renaming* to avoid corrupting the actual registers until it
> knows if the branch was taken or not. If it should predict wrong, it will
> need to invalidate the instructions. For this, the *reorder buffer* is
> used.

**Why do we not have fully associative caches in CPUs?**
> We would need too many comparators (parallel lookup units) to find the
> wanted address. The space needed can be better utilized by other
> components.

**What is the purpose of having sets in a cache?**
> The purpose is to reduce the risk of two or more addresses being mapped
> to the same row in the cache. This would result in cache misses as the
> value would be overwritten many times. Set associative caches are used to
> divide the cache so that the need for comparators is minimized.

**In a 4-way set associative cache, where can the data at memory address A be
placed?**
> In one of the sets defined by a function (`i = addr % CACHE_SIZE`). The
> sets will each contain four *cache blocks*, thus the need for the same
> amount of comparators (since the address may be placed anywhere within the
> cache block).

**When reallocating memory, what is the advantage of `realloc` over a
combination of `malloc` and `free`?**
> With `malloc` you can run out of memory in a situation where `realloc`
> would find memory. `realloc` also has a chance to be faster.

**Write a function to check that a void pointer `ptr` has a value which is a
multiple of `size_t a`**

```c
#include <stdint.h>

int aligned(void *ptr, size_t a)
{
        /* We know that 'a' is a power of two, i.e. only has one bit set to one.
         * This means that if we subtract 1 from this number we get 'k' ones.
         * Where k comes from `a = 2^k`.
         *
         * If 'ptr' is a multiple of 'a', then all of its least significant bits
         * will be zero.
         *
         * Example: a = 4 and ptr contains 48
         *
         * Then                    a   == 0b100
         *                         a-1 == 0b011
         *                         ptr == 0b110000
         *      (uintptr_t)ptr & (a-1) == 110000 & 011 == 0
         */
        uintptr_t b = (uintptr_t)ptr;
        return (b & (a - 1)) == 0;
}
```

**Checking if something is a power of two**

```c
bool two_power(int x)
{
        /* The idea of the right side is explained in the 'aligned'
         * function above
         *
         * If a < 0 || a == INT_MIN, then this would yield true, despite
         * not being a powers of two
         */
        return x > 0 && (x & (x-1)) == 0;
}
```

Tools
=====

**gcov**
> Counts exact execution counts for each source line as well as branch
> frequencies (taken/non-taken). Needs special flags for the compilation and
> affects compiler optimization.

**gprof**
> Execution times are shown for the different functions and the number of times
> each function is called and by which function. Same disadvantages as *gcov*.

**OProfile**
> Can count the number of times certain events happen such as: clock cycles,
> executed instructions cache misses. Can be presented at source code level or
> instruction level. Advantages over *gcov*/*gprof* are that it does not need
> special flags and should be used with the highest level of optimization. A
> disadvantage is that to change what it should count, the user must have root
> privileges on the machine.

**valgrind**
> Can detect many kinds of pointer and memory allocation errors. It can also
> produce statistics of heap memory usage and cache performance.  Doesn't
> require flags, but works best when debugging information is available. Is
> much slower than other tools (e.g. 100 times slower execution).

**cachegrind**
> Cachegrind is used for performance measurement of the cache and the
> processor's branch prediction. In contrast to valgrind, it is better to
> enable optimization (and -g). Is used together with valgrind
> `valgrind --cache-sim=no --branch-sim=yes --tool=cachegrind...`.

**massif**
> Measures the amount of heap memory different parts of a program allocates. Is
> used valgrind to generate data. Can be plotted in nice graphs.

**strace**
> Prints to a file or to `stderr` each system call a process makes, with
> arguments and return value, as well as signals it receives.

C
=

`alloca`
> Macro for allocating on the stack used when the data size is reasonable and
> it isn't returned from the allocating function

**Arenas**
> A chunk of memory allocated at once. Used instead of making many calls to
> `malloc`. When all the work is complete, the arena can be deallocated at
> once. This makes arenas useful when many calls to `free` occur at once.

**Free-lists**
> If it happens often that objects of the same size are allocated and
> deallocated, they can be put in a free-list instead of deallocating them
> using `free`. If the objects are of different sizes or only deallocated near
> the end of an execution, free-lists are *not* useful.

**Arithmetic and Logical Shift**
> Arithmetic shift keeps the sign, logical will shift in zeros.  To get logical
> shift, you need an `unsigned`.  To get an arithmetic, simply use a `signed`
> type.
>
> **OBS!** Shifting *right* is not standardized to be logical or arithmetic. Meaning
> it is up to the compiler implementation to decide. Usually, the above applies
> (GCC and Clang), but it doesn't have to. Write a program to test your
> compiler.
>
> Below is an implementation of getting the ones in an `unsigned long long`

```c
unsigned count(unsigned long long a)
{
    unsigned ones = 0;

    for (; a > 0; a >>= 1)
            if (a & 1) ones++;

    return ones;
}
```

**Rearranging fields in structs**
> This is not allowed to be done by the compiler. To minimize the struct size,
> you need to arrange the fields such that the alignment padding is minimized.
