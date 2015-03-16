1.  Whenever passing an array to a function, the function could
    theoretically change the array since it's not passed by value. 
    Instead of copying the whole array every time we call the function
    it is more efficient to pass a pointer.
    
1.  Matrices are stored in the same way as an array. The first block denotes the
    amount of rows, the second the stepsize between them. Meaning that if we
    have:
    ```
    char c[3][4];
    ```
    Then the matrix is basically saved as an array of size 12, using the blocks
    as syntactic sugar. The following two are equivalent:
    ```
    c[2][3] = 'r';
    printf("%c\n", c[2][3]);

    *(&c[0][0] + 2*4 + 3) = 's';
    printf("%c\n", c[2][3]);

    ```

1. Arithmetic with pointers:
  1.  pointer - pointer: only valid if both pointers point into the same array
      and the result is the number of elements between the pointers.
  1.  pointer + integer
  1.  pointer - integer
  1.  pointer + constant

1.  realloc tries to allocate the memory succeeding the block of memory given as
    an argument, if it fails with this, the function proceeds to allocate memory
    somewhere else. This will render all pointers pointing into the memory block
    potentially dangerous.

1.  If realloc fails completely, it returns NULL.

1.
    ```
    (*list).succ = NULL;
    /* equivalent to: */
    list->succ NULL;
    ```

1.  The string "C11" needs 4 bytes, one for each visible char and one for the
    string terminating character: '\0'

    The call strlen("C11"), returns 3.
