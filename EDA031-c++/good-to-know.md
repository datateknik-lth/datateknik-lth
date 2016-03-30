# Good To Know

## Short Explanations

- **What is a friend function?**

  A `friend` function is a function which is not a member of the class but 
  can still access all the member of the class. To make it happen we need to 
  declare a function `friend` in the class.

```cpp
class A {
  private:
    int nbr;
  public:
    A(int n) : n(nbr) {};
    void add(int value);

    // Function square is a friend of class A
    friend void square(A &aclass);
};

...

void square(A &aclass) {
  aclass.nbr*= aclass.nbr;
}

```

- **Explain `this`**

  `this` is a pointer variable which always holds the current active object's 
  address.

- **What is the difference between a struct and a class in C++?**

  By default the members of struct are public and the members of a class are 
  private.

- **What is the preprocessor?**

  The preprocessor is a program that runs *before* the compiler and essentially 
  performs text substitution.

- **What is `cout`?**

  `cout` is a object of class `ostream`. The stream `cout` is by default 
  connected to the console output device.

- **What is `cin`?**

  `cin` is a object of class `istream`. The stream `cin` is by default 
  connected to the console input device.

- **What is a reference variable?**

  A reference variable is an alias (anoter name for an already existing variable).
  Once a reference is initalized with a variable, either the variable name or 
  the refrence name may be used to refer to the variable. 
  Some notes about references:

   - You cannot have `NULL` references. 

   - Once a reference is initialized to an object, it cannot be changed to 
    refer to another object. Pointers can be pointed to another object at any time. 

   - A reference must be initialized when it is created. Pointers can be 
    initialized at any time.

```cpp
// Create a reference:
int i = 14;

int& r = i;     // r is a reference to i
```

> "Use references wherever you can, pointers wherever you must. Avoid pointers until you can't".

- **What is a Member Function?**

  A member function is a function that is defined as part of a class. Member functions 
  are sometimes referred to as **methods**.

- **What is `const`?**

  `const` is a keyword that define objects that cannot be changed. `const` 
  objects must be initialized, because there is no way to give them a value 
  after they are defined.

- **What is a class template?**

  A class template is a blueprint from which specific class types can be created. 
  To use a class template, we must specify additional information. For example, 
  to define a `vector`, we specify the element type: `vector<int>` holds `int`s.


- **What is `typename`?**

  `typename` is used to specify that the identifier that follows is a type.
  In a template each parameter must be preceded by the keyword `typename` or 
  `class`. `typename` more clearly indicates that the name that follows is a 
  type argument. However, `typename` was adedd to C++ after templates were already 
  in widespread use; some programmers continue to use `class` exclusively.

## Important Subjects

### Vectors
A **vector** is a collection of objects, all of which is the same type. To use a `vector`, 
we must include the header `<vector>`.

A `vector` is a class template. For a class template, we need to specify 
which class to instantiate by supplying an object inside a pair of angle 
brackets following the templates name.

`vector` is one of the sequential container types (other is `deque`, `list`, 
`forward_list`, `array`, `string`). Ordinarily, it is best to use a `vector` 
unless there is good reason to prefer another one.

#### Initialize a vector

**Empty vector:**
```cpp
vector<int> ivec;     // ivec holds object of type int
vector<vector<string>> file;    // files elements are vectors of strings 
```

**List initialize:**
```cpp
vector<string> fruits = { "apple", "banana", "lemon" };
```

**Specify Number of Elements:**
```
vector<int> ivec(10);   // ten elements
vector<string> svec(10); // ten string elements
```

**Specify Value and Number of Elements** using (*count*, *value*):
```cpp
vector<int> ivec(10, -1);   // ten int elements with value -1
vector<string> svec(10, "hi"); // ten string elements with value "hi"
```



#### Adding Elements
We can use `push_back()` to add a value at the end of the vector.

**Key Concept** `Vector`s grows Efficiently.

Since `vectors` grows efficiently, it is often unnecessary to define a `vector` 
of a specific size. In C++ it is a good idea to start with an empty `vector` and 
add elements at run time. 

#### Vector Operations

- `c.shrink_to_fit()` - request to reduce `capacity()` to equal `size()`

- `c.capaticy()` - number of elements `c` can have before reallocation is necessary

- `c.reserve(n)` - allocate space for atleast `n` elements

Note that `size` is the number of elements currently in the vector. `capacity` 
is how many elements it can hold before more space must be allocated.

`shrink_to_fit()` is only a request; there is no guarantee that the library 
will return the memory.

### Iterator
Iterator provides a mean for accessing data stored in container classes such as 
`vector`, `map`, `list`, etc. You can think of iterators as pointing to an item 
that is part of a larger container of items. All library containers have iterators. 

To create an iterator variable use the syntax:

```cpp
std::class_name<template_parameters>::iterator name
```

where `name` is the name of the iterator variable,
`class_name` is the name of the container we are using,
`template_parameters` are the parameters to the template used to declare objects that 
will work with this iterator. For example:

```cpp
std::vector<int> myIntVector;
std::vector<int>::iterator myIntVectorIterator;
```

To obtain an iterator, we can use `begin()` and/or `end()`. 
`begin()` returns an iterator that represents the first element.
`end()` is an iterator positioned "one past the end" of the container. If the 
container is empty, then `begin` returns the same iterator as the one returned 
by `end`.

In general, we don't care what kind of iterator the type has, so we can use `auto`.

```cpp
auto b = v.begin();
auto e = v.end();
```

As with pointers, we can dereference an iterator to obtain the element denoted 
by an iterator. Example:

```cpp
string s("some string");
if (s.begin() != s.end()) {
  auto it = s.begin();
  *it = toupper(*it);
}

```

#### Different Kind Of Iterators
Containers support different kind of iterators, each with a slightly different 
properties. Some iterators support writing data in the container, other only supports reading.

Iterators are classified into five categories depending on the functionality they implement:

- **Input** and **Output** - performs sequential single-pass input or output opererations.

- **Forward** - same functionallity as input/output iterators but they are limited 
to forward direction when iterating through a container.

- **Bidirectional** - similar to forward iterators, but also supports iterating backwards.

- **Random Access** - implements the functionality of bidirectional iterators, 
and also have the ability to access ranges non-sequentially. Distant elements can be 
accessed directly by applying an offset value to an iterator without iterating through 
all elements in between. Random access iterators have similar functionallity to standard 
pointers.

### Templates
Templates are the foundation for generic programming in C++. A template is a blueprint 
or formula for creating classes or functions. When we use a generic type, such 
as `vector`, or a generic function, such as `find`, we supply the information 
needed to transform that blueprint into a specific class or function. That 
transformation happens during compilation.

#### Function Templates
Rather than defining a new function for each type for our functions, we can define 
a **function template**. A function template is a formula from which we can generate 
type-specific versions of that function. Example:

```cpp
template <typename T>
int compare(const T &v1, const T &v2) {
  if (v1 < v2) return -1;
  if (v2 < v1) return 1;
  return 0;
}
```

A template definition starts with the keyword `template` and followed by a 
**template parameter list**, which is a comma-separated list of one or more **template
parameters** inside brackets. `compare` above declares one type parameter named `T`.
We can also use the keyword `class`, but `typename` more clearly indicates that 
the name that follows is a type name.

#### Class Templates
A **class template** is a blueprint for generating classes. We have used class templates
 when we used `vector`s. To use a class template we must supply a type inside 
 brackets. Example:

```cpp
template <typename T> class Calc {
  public:
    T multiply(T x, T y);
    T add(T x, T y);

};

template <typename T> T calc<T>::multiply(T x, T y) {
  return x*y;
}

template <typename T> T calc<T>::add(T x, T y) {
  return x + y;
}

...

calc<int> myCalculator;

```
  
### Operator Overloading
Operator overloading lets us define the meaning of an operator when applied to 
operand(s) of a class type. Sensible use of operator overloading can make 
our programs easier to write and easier to read. 

Overloaded operators are functions with special names: the keyword `operator` 
followed by the symbol for the operator being defined. Like any other function, 
an overloaded operator has a return type, a parameter list and a body.

We can overload existing operators, and cannot invent new operator symbols. Some 
of the operators we can overload is `+, -, *, <<, >>, ++, --, ->, /` among many 
others. 

We can call operator functions in the same way as we call ordinary functions. 
We name the function and pass an appropriate number of arguments:

```cpp
data1 + data2;      // normal expression
operator+(data1, data2); // equivalent function call

data += data2;      // expression based "call"
data.operator+=(data2);   // equivalent call to a member operator function
```

#### Operator Implementation
When we define an overloaded operator, we must decide whether to make the 
operator a class member or an ordinary nonmember function. In some cases, there 
is no choice - some operators are required to be members; on other cases, we 
may not be able to define the operator appropriately if it is a member. 

Guidelines:

- the assignment (`=`), array subscript (`[]`), function call (`()`) and member access arrow (`->`) 
operators **must** be defined as members.

- the compound-assignment operators ordinarily **ought** to be members. However, 
unlike assignment, they are not required to be members.

- Operators that change the state of their object or that are closely tied to 
their given type - such as increment, decrement, and dereference - usually should 
be members.

- Symmetric operators - those that might convert either operand, such as the arithmetic, 
equality, relational and bitwise operators - usually should be defined as 
ordinary nonmember functions.

#### Three Basic Rules of Operator Overloading in C++
src: <http://stackoverflow.com/questions/4421706/operator-overloading/4421708#4421708>

When it comes to operator overloading in C++, there are three basic rules you should follow. As with all such rules, there are indeed exceptions. Sometimes people have deviated from them and the outcome was not bad code, but such positive deviations are few and far between.

1. **Whenever the meaning of an operator is not obviously clear and undisputed, it should not be overloaded**. Instead, provide a function with a well-chosen name.
Basically, the first and foremost rule for overloading operators, at its very heart, says: Don’t do it. That might seem strange, because there is a lot to be known about operator overloading and so a lot of articles, book chapters, and other texts deal with all this. But despite this seemingly obvious evidence, there are only a surprisingly few cases where operator overloading is appropriate. The reason is that actually it is hard to understand the semantics behind the application of an operator unless the use of the operator in the application domain is well known and undisputed. Contrary to popular belief, this is hardly ever the case.

2. **Always stick to the operator's well-known semantics.** C++ poses no limitations on the semantics of overloaded operators. Your compiler will happily accept code that implements the binary `+` operator to subtract from its right operand. However, the users of such an operator would never suspect the expression `a + b` to subtract `a` from `b`. Of course, this supposes that the semantics of the operator in the application domain is undisputed.

3. **Always provide all out of a set of related operations.** Operators are related to each other and to other operations. If your type supports `a + b`, users will expect to be able to call `a += b`, too. If it supports prefix increment `++a`, they will expect `a++` to work as well. If they can check whether `a < b`, they will most certainly expect to also to be able to check whether `a > b`. If they can copy-construct your type, they expect assignment to work as well.


### Lambda Functions
A lambda is an unnamed function that is useful for short snippets of code that 
are impossible to reuse and are not worth naming.

A lambda expression has the form:

```cpp
[capture list] (parameter list) -> return type { function body } 
```
where

- *capture list* is an (often empty) list of local variables defined in the enclosing function,

- *parameter list* and *function body* is the same as in any ordinary function

We can omit the return type and the parameter list if we want. 

#### Capture list options

Inside the *capture list* we can specify different options:

- `[]` - capture nothing

- `[&]` - capture any referenced variable by reference

- `[=]` - capture any referenced variable by making a copy

- `[=, &foo]` - capture any referenced variable by making a copy, but capture variable foo by reference

- `[bar]` - capture `bar` by making a copy; don't copy anything else

- `[this]` - capture the `this` pointer of the enclosing class


#### Lambda Example

```cpp
for_each( v.begin(), v.end(), [] (int val) { cout << val; } );
```
## Common Algorithms

- `reverse()`

- `sort()` 

- `find_if()` 

- `make_pair()`

- `regex_search()`

- `for_each()`

- `erase()`

- `default_random_engine`

- `swap()`

- `remove_if()`



