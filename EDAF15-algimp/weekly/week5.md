Week 5
======

1. Which are the two forms of locality?
    - Spatial and temporal
1. What is meant by a cache block?
    - The bytes read from memory on a cache miss are collectively called a *cache block*
1. A  cache  is  divided  into  a  number  of  sets,  and  when  an  address
   is searched all rows in a particular set are checked to see if that row con-
   tains the searched address and needed data. What is a cache called if it is
   described as follows:
    - The cache has only one set - **fully associative**
    - Each set has four rows - **set-associative cache**
    - The number of sets and rows are equal - **direct-mapped cache**
1. When there are multiple rows in a set, are they searched in sequence or are
   the hardware address comparators duplicated so that they work in parallel?
    - The hardware address comparators are duplicated so that they work in parallel
1. What is the cache block size on the power machine?
    - 128 bytes
1. Modern optimizing compilers use a representation which makes it relatively
   easy analyze which statement has modified a variable. What is this
   representation called?
    - SSA (Static Single Assignment) form
1. What is the purpose of instruction scheduling?
    - To improve performance by reducing the number of pipeline stalls suffered
      during execution
