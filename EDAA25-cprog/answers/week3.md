1.  For characters requiring 32 bits there are two options available for a C
    programmer:
    * Wide characters:  these use type wchar_t for objects and the prefix L with
                        character constants and strings (of wide chars)
                        There are two disadvantages, a type different from plain
                        char must be used and it's a potential waste of memory
                        since all characters must use a fixed width container.
    * Multibyte characters: UTF-8, and other similar encodings. Advantages
                            include: ASCII compatibility, saves memory compared
                            to wchat_t and it is self synchronizing. Quick
                            recap: ASCII requires 7 bits, the eigth bit is used
                            to indicate if it is a non-ASCII character. I.e. set
                            to one when the represented character isn't ASCII.

1.  The program prints 8. The loop has its own scope.

1.  Linkage has to do with scope.
  * Internal linkage: file scope (static variables outside of functions and
                      externed varibles)
  * No linkage: only linkage outside of current scope.
  * External linkage: linkage outside of current scope.

  Example:
  ```
  static int a; //internal linkage

  int main()
  {
    int a;  //no linkage;
    {
      extern int a; //external linkage (same as outer a)
    }

    return 0;
  }
  ```
1.  Type aliasing: two values with incompatible types are used to access the
    same or partially overlapping objects. This is a violation of the ANSI C
    aliasing rules.

1.  Since unsigned integers can only represent positive integers, using the
    unsigned version results in being able to represent twice as many positive
    numbers. Meaning that the bit representation of -5 is the same as some large
    number, when using an unsigned type.

1.  This process is called integer promotion, and it occurs when performing
    arithmetic on a type ranked lower than an int. The value of the varible
    is then represented in an int if the original type can be represented within
    an int (can be promoted to unsigned int if the value cannot be contained
    within the signed int).

1.  When only needing to represent a small number, one can use a bit-field.
    Specifying something like:
    ```
    struct {
            unsigned int a : 4;
            unsigned int b : 3;
    } rect;
    ```

    The compiler will then add padding to the struct, making it atleast the size
    of an int. (I.e. sizeof(rect) will most likely result in 4.)

    We should use unsigned ints since the result of the following example can
    result in both 1 and -1. (Due to compilers using different signedness)
    ```
    struct {
      int a:1;
    } node;
    
    node.a = 1;

    printf("%d\n", node.a);
    ```

1.  Enums are integer-based, meaning that they cannot represent larger numbers
    or fractions. When debugging however, they are useful, since the debugger
    can print out their variable names.
