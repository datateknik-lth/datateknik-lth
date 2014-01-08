1.  Unspecified behaviour: The C-standard has provided several alternatives for
    the compiler to choose from.

1.  Undefined bahviour: anything can happen

1.  Implementation defined: the implementation 


When using a macro to make static assertions during compile time:

```
#define PASTE(a,b) a##b
#define EXPAND(a,b) PASTE(a,b)
#define STATIC_ASSERT(expr) typedef char EXPAND \
    (failed_static_assertion_in_line_, __LINE__) \
    [(expr) ? 1 : -1]
```

To align stuff:

```
/*  Called with malloc_aligned(128, 32, &q); */
void *malloc_aligned(size_t n, size_t a, void **ptr)
{
        uintptr_t b;
        void*     p;

        n += a-1;

        *ptr = p = malloc(n);
        b = (uintptr_t)p;
        b += a-1;
        b &= ~(a-1);
        p = (void*) b;

        return p;
}
```
