Week 4
======

1. Which are the five main steps in instruction execution on a RISC processor?
    - IF (instruction fetch)
    - ID (instruction decode)
    - EX (execute)
    - MEM (read from or write to *memory*)
    - WB (write back, save result in destination register)
1. In a five-stage pipeline of a processor which can issue (i.e. start executing)
   one instruction every clock cycle, what is the ideal performance execution?
    - Ideally a pipelined processor starts an instruction each clock cycle
1. During the 1970's, most computers did not take advantage of pipelining. Why?
    - Too difficult to implement in the CISC processors being used
1. Why can there be a pipeline stall after a load instruction but not after an
   add instruction?
    - Because the add instruction can be completed immediately the value is
      forwarded if needed, but a load instruction will take one extra cycle if
      the value is needed immediately after its execution
1. When more than one instruction starts executing every clock cycle, it
   becomes very likely that a conditional branch instruction will be executed
   in a clock cycle. It is important to start fetching new instructions to be
   executed after the branch but since the processor cannot know for sure
   whether a conditional branch will be taken or not, it must guess which
   instructions to fetch. What is the table used for this called?
    - Branch history table
1. By guessing which instructions should be executed, a superscalar processor
   uses speculative *execution*. Consider a store instruction that is executing
   speculatively. Which mechanism is used to prevent the store from modifying
   memory before it is certain that it will be executed?
    - Reorder buffer
1. What is the purpose of *rename registers*?
    - To avoid data true dependence (i.e. Ins1 produces a value Ins2 needs)
1. What do the terms *temporal* and *spatial locality* mean?
    - Temporal means that the instructions are close in time and spatial that
      they are close in memory
