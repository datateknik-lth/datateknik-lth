1.  To import a file we would write:
    ```
    #include <stdio.h> /* This is also where printf is defined */
    ```

1.  We use:
    ```
    int i;
    println("%zu", sizeof(i));
    ```
    Since sizeof returns size_t

1.  We have of course: heap, stack, data and text.
    Where the text segment contains the program instructions, and data contains
    global and static variables.

1.  The program counter keeps track of which instruction is to be executed next.

1.  The activation records are stored in on the stack, the last address of the
    call frame is the return address. In for instance the MIPS architecture the
    return values are stored in special registers.

1.  The pointer is a variable which contains an address to a variable. Meaning
    that: yes, it is just a number. But there are certain constraints when using
    different pointers. An integer will be allocated on a multiple of its size,
    meaning that if it is 4 bytes long, the pointer to its location will be a
    multiple of 4.

1.  On the stack we can allocate a VLA array using:
    ```
    int i[n];
    ```

    But on the heap we would do something like:
    ```
    int *i = malloc(sizeof(int) * n);
    ```

    Make sure that the pointer is not equal to NULL afterwards.
