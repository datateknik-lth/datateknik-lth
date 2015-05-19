Week 7
======

1. On which format are signed integers almost always represented in C?
    - Two complement (there aren't two zeros)
1. Represent -2 using four bits
    - `2 => 0010 => invert => 1101 => +1 => 1110`
1. What does arithmetic underflow mean?
    - when the result of a calculation is smaller than what can be stored in
      memory using its type
1. What is the result of dividing by *arithmetic shift*? When you divide -1 by
   2? Why is it wrong?
    - `-1` is represented as `1111 1111` (using 8 bits) and a right arithmetic
      shift results in `1111 1111`, which is still `-1`
1. What is a subnormal floating point value?
    - If the number is closer to zero than `1.0*2^e_min`
1. While it is obvious that it is the common case that should be optimized, how
   can you know which is the common case?
    - By using profiling tools such as gprof, OProfile, and in some sense
      Valgrind. In the end we might need to study the produced assembly, the
      algorithms used, the data structures
1. Suppose you need to make sure a pointer is aligned on a certain power of
   two. What does that mean and how can you do it?
    - `(x + pow_of_2 - 1) & (~(pow_of_2 - 1))`

The last bit is tricky, but can be explained in the following example.

We get the address *200*, and we want to align it to `2^5 = 32`. The next
multiple of 32 after 200 is *224*. So we take the number `2^5 - 1` and add it
to our address.

```c
char *addr = malloc(...)    // gives back 200
addr += block - 1           // block == 32 => 200 + 31 = 231
addr &= ~(block - 1)        // => 128 + 64 + 32 = 224
```

The last AND operation can be seen as `231 = 11100111`, Inverse of 31 is
`00011111` `11100111 & 00011111 == 11100000 == 224` or `128 + 64 + 32`
