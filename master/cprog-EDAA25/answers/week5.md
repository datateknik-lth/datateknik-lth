1.  Since the preprocessor is basically copy- paste. This means that the first
    call defines "a" as "++x" which means it'll be incremented twice in the
    first macro.
    And the second macro is inefficient as it calls cos(x) twice.


1.  
