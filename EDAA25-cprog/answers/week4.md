1.  A type which contains a VLA is called a variably modified type.

1.  Since we need to be able to figure out the step size in the loop we need to
    declare it as:
    ```
    double (*p)[n];
    ```
    Remember to include stdlib.h for malloc
1.  uintptr_t and intptr_t

1.  Natural alignment refers to giving data items an address which is a multiple
    of its size.
    ```
    /*  Results in a struct of size 8 */
    struct node_t {
            short a;
            char  b;
            short c;
            char  d;
    };

    /*  Results in a struct of size 6 */
    struct node_t {
            char  b;
            char  d;
            short a;
            short c;
    };
    ```
    Since the compiler is not permitted to change the ordering within the struct
    it must insert one extra byte between a and c in the first defintion. These
    bytes are called padding. It is important to note that the last member is 
    padded with the number of bytes required so that the total size of the 
    structure should be a multiple of the largest alignment of any structure member.

1.  Lets say we want to align pointer with size_t 8, aka we want to round up to the next multiple of 8.
    We start by adding 7 to the size (think modulo) and then remove all bits < 8, aka bitwise complement:
    ```
    unsigned a = (unsigned)p;
    a = (a + 7) & ~7;
    p = (double*)aa;
    ```
    

1.  A flexible array member is an array of unspecified length inside a struct.
    ```
    struct list_t {
            int a;
            int b[];
    }
    ```
    It must be the last member of the struct (all other types must be complete)
    and it cannot be the only member of the struct.

1.  It may be modified once, and the must common sequence point is variable
    assignment.
    I.e. this is illegal:
    ```
    --i++;
    ```
1.  The macros are pretty self explanatory:
    * __FILE__: expands to the file name of the file where it is printed
    * __LINE__: expands to the line where it is printed
    * __DATE__: expands to the date of compilation
    * __TIME__: expands to the time of compilation

    All of these are good to use for debugging.
