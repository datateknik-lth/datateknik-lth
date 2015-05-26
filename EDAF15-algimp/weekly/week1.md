Week 1 - C repetition (1/3)
===========================

1. To print in C we need to "import" the declaration of printf. How do we
   import a file and which file declares `printf`?
    - `#inlude <stdio.h>`
1. How can we ask the compiler the size of bytes of a certain type or variable?
    - `sizeof(var)`
1. Into which four segments is the address space of a running program divided?
    - data, text, heap, stack
1. What is the purpose of the program counter?
    - To keep track of which instruction that should be executed
1. Why do we need to store the return address of a function and in which of the
   four memory segments are the call frames stored?
    - The call frame is stored on the stack, if the function being returned
      from calls another function, we need to be able to return to the parent
      after returning from the child
1. Is a pointer simply a variable which contains a number?
    - Yes, but the number (should) be a valid address
1. `f(int a[10000])` does not pass an array to the function, why?
    - The array is optimized into a pointer
1. Why can you not return a VLA or an array allocated with `alloca`?
    - The VLA will be created on the stack, `alloca` is a macro to allocate
      on the stack. You should not return pointers to elements in the stack,
      should it be popped
1. How would you allocate memory for an array of `n` integer elements and return
   it to the calling function?
    - `return malloc(sizeof(int) * n)`
