Terms
=====

**Interrupts**
> Signals from external device which interrupt the current thread of execution.
> Makes processor switch to supervisor mode.

**Exceptions**
> Occur in the pipeline/MMU. Makes processor switch to supervisor mode.
> I.e. exceptions are similar to interrupts, except that they are generated
> internally in the processor (including MMU).

**System calls**
> System calls switch to the kernel through the use of a special instruction in
> order to switch to supervisor mode and enter the kernel. Makes processor
> switch to supervisor mode. This is done to perform some task that only the
> kernel may perform.

**Page table**
> A page table contains mappings from virtual to physical pages and information
> about whether the page was recently accessed, modified after it was copied to
> RAM, readonly, whether it is in RAM or on swap device. The page table can be,
> and often is, implemented as a multi-level table where the virtual page
> number is divided into e.g. three parts. Each part is used to index an array.
> Each indexed array element contains a pointer to a new array which is indexed
> by the next part of the virtual page number. Due to locality of references,
> this approach saves memory, since the complete address space needs not be in
> memory - only the used pages.

**Page fault**
> The data of the requested page is not in RAM and must be fetched from swap.

**TLB**
> The *Translation Lookaside Buffer* is used in order to cache the translation
> between virtual and physical addresses. Two caches are used, one for
> instructions (I-cache) and one for data (D-cache). The TLBs are usually fully,
> associative, and managed either directly by hardware or the kernel.

**Multiprogramming**
> If a process needs to wait for I/O, another process runs instead. The purpose
> is to use the resource better, but if waiting is shorter than the time to
> context switch, it's better to wait for the I/O to finish.

**Dual-mode processor**
> A processor has a user mode and a supervisor mode state

**Process**
> A process is a program (object code stored on some media), in the midst of
> execution. They also include a set of resources, such as open files, pending
> signals, processor state, memory address space, one or more *threads of
> execution* and a data section containing global variables.

**User credentials**
> Every user has a user ID (UID) and a group ID (GID). These credentials are
> checked e.g. every time a user wants to access a file. They can thusly be
> used to allow/disallow users access to certain files and/or directories.
>
> In Linux files have permissions for owner, group and others.


**Memory mapped file**
> A memory mapped file is mapped to a virtual address. An advantage of memory
> mapped files over accessing them as files is that `lseek` system calls can be
> avoided.

**Completely Fair Scheduler**
> The point of CFS is to be fair, hence the thread which has the lowest
> `vruntime` will be scheduled next. To keep track of this the scheduler
> keeps running tasks in a RB-tree. The tree is self balancing and the task
> with the lowest `vruntime` is kept furthest to the left. Hence, getting the
> task to run next is a constant time operation (because of smart
> implementation), while (re-)inserting a task is a `O(log n)` operation. Thus,
> every task slowly, but surely migrates to the left, eventually becoming the
> next task to run.
>
> CFS has run priorities, but uses them as a decay factor. This factor will
> make a low prioritized task's `vruntime` increase faster.

Common questions
================

**What is a SETUID program and how can this feature be useful?**
> When accessing a file, the effective user id is checked. Thus, to edit
> a file which you do not have access to - you can use a SUID program.
>
> The program will give the running user your UID as effective UID. Thus
> allowing the user to change the file. A SUID program can thus allow users
> to make controlled changes to files. A simple example is protecting a
> highshcore file this way (i.e. only letting the game change the file).

**How can the kernel make sure the process's variable errno gets the proper
error code despite the kernel not knowing the actual address of said
variable?**
> The kernel can put the error code in the normal return value register,
> and then instead of doing a normal return to the library function which
> executed the system call instruction, it can return to instructions which
> writes the error code in the `errno` variable then the `-1` value in the
> return value register to indicate a failed system call. This works, since the
> code that makes the system call is part of the application's address space.

**What are pipes used for?**
> Pipes are used to redirect output and input between two programs.
> i.e. `ls | less` will take the output from `ls` and redirect it to
> the input of `less`.

**Why would the shell need to create the pipes?**
> The reason that the shell needs to implement this is simply because the
> applications themselves should be unaware of the redirection of `stdin` and
> `stdout`. They should just read/write like normal.

**How can the kernel know whether an executable file is a shell script or, for
instance an ELF executable file?**
> The kernel can look at the first couple of bytes. Scripts start with "#!path",
> while ELF files start with the following four bytes: `[0x7f, 'E', 'L', 'F']`.

**What is meant by "closing" a pipe? Why is it important?**
> Closing the pipe means closing the file descriptor representing the pipe.
> This has the effect that the number of proccesses which have the pipe open
> is decremented by one. Not doing so results in the kernel thinking that the
> process with the pipe open for writing might write to it in the future - i.e.
> the process will never receive EOF.

**Why is the concept of process groups useful with pipes?**
> If we for instance want to kill, stop or resume the entire pipeline it's
> sufficient for the shell to make one `kill` system call with a negative
> process id so that it is delivered to all processes in the group.

Virtual Memory
--------------

**How many years has virtual memory existed in commercial machines?**
> 50 years (from 2011), it was *invented* in 1956

**Which company made the machine in the previous question?**
> Burroughs

**Why are there usually two TLBs?**
> The TLBs are used to cache addresses for data and instructions. Since these
> two types have different spatial locality it is best to cache them separately.
> Even if the data is close to some instructions, they might be altered by
> instructions contained elsewhere.

**Explain what happens when a process wants to read data only located on the
swap**
> * The process requests a translation from the TLB, which is not found
>   this is performed either by the kernel or hardware.
> * A page fault is detected. A page to replace (if applicable) is selected.
>   If the page has been modified it must be written to the swap device. To
>   find where, the core map entry is inspected.
> * When the previous owner's page table entry has been updated, the new page
>   table is set to the owner of this page in the core map. Where the page was
>   stored can also be written in the core map entry.
> * The requested page is fetched from swap and the page table entry is updated.
> * The translation can be put in the TLB entry and the process can resume
>   execution.

**When a physical page is replaced and used for another virtual page, how can
the kernel find the previous owner of the physical page and why would it want
to find it?**
> The coremap, indexed by physical page number, contains a pointer to the
> owning page table entry. This must be updated so that its data can be found
> on the swap when needed in the future.

**What is the second chance page replacement?**
> The coremap array is searched and when a page entry with reference bit zero
> is found, then that physical page is used. When the reference bit is one, it
> is instead set to zero. The search wraps around after the last page has been
> inspected. The start index of the coremap is decided in a round-robin
> fashion.

**What is a linear page table?**
> Instead of using a multi-level page table, one could place it entirely in
> virtual memory. This would let the virtual memory management deal with placement
> in memory etc.

**Translating virtual to physical page numbers for every memory access seems to
significantly degrade performance. Why does it *usually* not?**
> The TLBs cache translations. If the translation is found in the TLB, there is
> no additional cost. It is very important that the hit ratio in the TLB is
> high. Otherwise, performance degrades quickly.

**What is a TLB-fault and what does the kernel (if involved) do about it?**
> A TLB-fault is an exception triggered when a translation was not cached in
> the TLB. The kernel will look up the page table entry and replace some other
> translation in the TLB with the new one. If the page was not in RAM more
> processing is required.


File systems
------------

**Why is the system call to remove a file from a directory called `unlink` and
not `remove`?**
> The system call removes only the directory entry and not the file itself,
> unless it was the last directory entry referring to that file.

**Except for mount points, why can a normal UNIX directory not contain files
stored in a file system (hdd partition) different than the directory itself is
stored in?**
> The directory contains mappings from file names to inode numbers, and in
> particular there is no attribute which specifies a partition.


**Why are file reads more frequent than file writes, but disk writes more
frequent than disk reads?**
> The caching of files in memory usually hit, but the modified files must be
> written to disk. Hence, reads are often avoided while writes can only be
> avoided if exactly the same block is overwritten before it reaches the disk.

**How are modern file systems designed to exploit the above fact?**
> EXT3 makes the writes in a journal which avoids time consuming moving of the
> disk write head. After data has been written to the journal, it is copied to
> its correct locations in the file system, but this copying is not time
> critical.

**Two ways to reduce the number of system calls for accessing a file are:**

- **Memory map the file using `mmap`**
- **use the C library call `setvbuf`**

**For which file access patterns is each most suitable and why?**
> Normal buffering, possibly with a larger buffer set by `setvbuf` works well
> for sequential accesses, and `mmap` can additionally be useful for more
> irregular accesses since it can eliminate the need for using the `lseek`
> system call. By mapping a file to virtual memory, instead of `lseek` calls,
> simple pointer arithmetic is sufficient

**The BSD Log-structured File System (LFS) needs an inode map. Why?**
> A modified inode is written in the log and to find the current version of an
> inode, the inode map is needed. An inode, thus, has no permanent location on
> the disk in LFS as on e.g. EXT2/3.

**What are extents?**
> Extents replace the traditional block mapping scheme used by EXT2/3. An
> extent is a range of contiguous physical blocks, improving large file
> performance and reducing fragmentation. There can be 4 extents stored in an
> inode. If there are more extents to a file, they are indexed in an `HTree`.

**What does the cleaner process do with LFS?**
> The cleaner process performs garbage collection in order to create fresh
> segments that can be used for writing in the log.
>
> * Overwritten data blocks of a file, or removed files - no action
> * If a segment `S1` has live data (i.e. still in use) that and live data from
>   other segments can be collected and copied to a segment `S2` in order to
>   make `S1` reusable

**What is the key idea behind EXT3 as opposed to BSD LFS and EXT2?**
> Instead of as in BSD LFS using an entire disk partition as a log, EXT3 keeps
> the EXT2 file system structure but extends it with a small log to which
> writes are first performed. Subsequently the data is copied to the normal
> disk blocks.

**EXT4 supports fast access to large files. How?**
> By using so called extents which are areas of size up to 128MB consisting of
> consecutive disk blocks. I/O is faster with larger disk blocks.

**What are UNIX signals and why is it important to return from a signal handler
via the kernel?**
> *UNIX* signals are a way for the kernel to inform a process of an event.
> The process can set up a function to run when the signal is received.
> When the function is running, the corresponding signal is blocked. Therefore,
> if the function never returns, the signal remains blocked. The signal handlers
> return, not to the program, but to the kernel which can unblock the signal and
> then return to the program.

**Looking at a traditional UNIX file system such as EXT2, how would you
modify it to achieve the following goals:**

- **faster recovery after a crash**
- **faster writes**
- **faster reads of video streams**

> * By having a log or journal which is written as transactions, recovery
>   can be made by inspecting journal instead of doing full system check.
>   A full check would include all files and directories to see that the inodes'
>   reference count match the number of times a file is listed in directories,
>   and that the used disk blocks match the inodes and free block table.
> * Faster writes can be achieved by writing to a log and then copying the
>   written data to the normal file system locations (as in EXT2). This is used
>   by EXT3 and makes it possible to make disk writes with minimal write-head
>   movements since the data is written in sequence. After the data has been
>   written to the log it can be copied to the correct location on disk (not
>   time critical).
> * By allocating larger blocks consisting of sequential blocks. Such large
>   blocks can be allocated for instance using a buddy system. Used by EXT4.

Synchronization
---------------

**How can false cycles be avoided in distributed deadlock detection when there
is a central coordinator that detects cycles?**
> The nodes maintain the partly resource allocation graphs, which are sent to
> the central coordinator when requested. If an edge is observed to be added
> before an edge is deleted, it may report false deadlock. To avoid this,
> timestamps can be used. This is illustrated in the example below. If `P0` has
> released `R` there should be no cycle for a deadlock. But if message `2`
> reaches the coordinator first, then a false deadlock is detected.

```
[P0]<-(S)<-[P2]
 |          ^
 v          |           1. P0 releases R
(R)        (T)          2. P1 waiting for T
 |          ^
 v          |
[P1]---------
```

**What is a ticket-based spinlock and what hardware feature does it require?
Which performance problem does this lock have, if any?**
> Atomic fetch-and-increment or test-and-set instructions are needed.  A
> ticket-based spinlock has a FIFO queue that determines who gets the lock
> next. A disadvantage with ticket-based spinlocks is that at an unlock, all
> waiting CPUs will fetch the counter telling whose turn it is. While it would
> be better that only the CPU which will get the lock should be informed.

Scheduling
----------

**How does Solaris deal with priority inversion?**
> Solaris implements turnstile behavior, where the higer prioritized thread
> can lend its priority to the lower thread, thus letting the lower prioritized
> thread complete sooner.

**What is affinity scheduling?**
> To schedule a thread on the same CPU as it was running last time in order to
> have some useful data left in the cache.

**What is the difference between soft and hard affinity?**
> Soft affinity, which Linux uses, the scheduler only *tries* to schedule the
> process to run on the same CPU. If it is infeasable, the process will be
> migrated to another CPU. With hard affinity, if the process is bound to CPU
> 0 - it can *only* execute on CPU 0.
