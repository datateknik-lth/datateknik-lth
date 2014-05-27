#Risk Management

> A risk is a potential problem; a problem is a risk that has materialized

[Fairley 1994]

##What can go wrong?
 * Staff turn-around: quit, moved to other project, illness
 * Tools do not work as anticipated
 * Requirements change more than expected
 * Effort estimates were wrong
 * Expected input/deliveries are delayed
 * Quality is not good enough in the end of the project

##What is risk?
 "An uncertain event or condition that, if it occurs, has a positive or negative effect on a project's objective"
 It consists of both a **cause** and an **effect**
 For example:

 - Use of new compiler (**cause**)
 
  Integration problem && delayed training phase (**effect**)

 - Low top management priority in Project A (**cause**)

   Resources (staff) moved from project A to another project (**effect**)

###Risky commitments - Overscoping
The main risk of overscoping is that the project target (scope)
will not be met in *time* and on budget (*cost/effort*).

 * The traditional dev model (waterfall) - sequential & doc-driven

   "*overpromise* software capabilities in cortractually binding requirements
   specification before they *understand* their risk implications."

 * Agile dev model (XP/Scrum) - iterative & code driven

   "... neat ideas... I'll code 'em up, and if they *don't fit* other 
   peoples ideas, we'll just evolve things until they work."
   
###Risk Management

 * Risk Assessment
   - Identification (What might go wrong?)
   - Analysis & prioritization (What are the most serious risks?)
 * Control of risk
   - Planning & Resolution
   - Monitoring

#### Approaches to risk identification:
 Includes but isn't limited to:
 * Use of checklists, check which risks may come up based on previous experience.
 * Brainstorming - getting knowledgeable stakeholders together to pool concerns.
 * Casual mapping - Identifying possible chains of cause and effect using a map.
 
##### Casual mapping (Applied example)
```
                                (DELAY IN PROJECT!)                                           
                               /                  \                
                              /                    \              
                             /                 (Poor project outcome)                     
                            /                            \              
                           /                              \              
                          /                                \              
(Unrealistic schedule estimates)                      (Lack of skill)
```

#### Risk assessment

Risk exposure = Potential Damage * Probability 

* Not neccesary nor possible to give exact estimates: Qualitative descriptors
  , e.g High, Significant, Moderate and Low.
* Pripritizethe worst risks (high probability and large damage)


##### METHOD: Cost-Probability Matrix
```
(cost)        _____________________________
             |       |xxxxxx|xxxxxx|xxxxxxx|
High         |       |xxxxxx|xxxxxx|xxxxxxx|                         
             |_______|xxxxxx|xxxxxx|xxxxxxx|    
             |       |      |      |xxxxxxx|
Significant  |       |      |      |xxxxxxx|                              
             |_______|______|______|xxxxxxx|      
             |       |      |      |       |
Moderate     |       |      |      |       |                                
             |_______|______|______|_______|      
             |       |      |      |       |
Low          |       |      |      |       |
             |_______|______|______|_______|
                Low    Med    Med+    High   (probability)                      
```
The worst risks are indicated by X'es since they both have a high cost and probability.

##### METHOD: Decision Tree

In this scenario we ponder on wether or not to extend or replace a system.
The outcome of this depends on if the market expands or not.
If we extend the system and the market expands we lose -100.000$, if it doesn't expand
we will gain 75.000$.
If we replace the system and the market expands we gain 250.000$, if it doesn't
expand we lose 50.000$
```
                                                                             
                                                                                     
                    ,_______________     Net Product Value (NPV)                                               
      ,____________/ (20%) Expansion     -100.000 $                                                     
     /   Extend    \ (80%) No Expansion   75.000 $                                                              
    /               `---------------                                        
   /                                                  
  /                                                       
D                                                        
  \                                                       
   \                                 
    \               ,_______________                           
     `-------------´ (20%) Expansion      250.000 $                                          
         Replace   \ (80%) No Expansion  -50.000 $                                               
                    `---------------                                                 
```
If we extend the risk exposure is:
RE = -100.000 * 0.2 + 75.000 * 0.8 = 40.000
And if replace the risk exposure is:
RE = 250.000 * 0.2 - 50.000 * 0.8 = 10.000
Therefore in this example we should obviously **EXTEND THE SYSTEM!!!!!!**


#### Risk planning: There are five alternatives:
1. Acceptance
1. Avoidance - Find a risk-free solution.
1. Reduction - Reduce probability
1. Mitigation - Reduce damage, e.g. taking backups
1. Transfer - e.g. outsource

#### METHOD: Risk reduction leverage

##### Risk reduction leverage is a method of comparing different options by comparing risk exposures.

RRL = (RE\_before - RE\_after)/(cost of risk reduction)

RE_before is risk expose before risk reduction, e.g. 1% chance of
a fire causing $200k dmg.

RE_after is risk exposure after risk reduction, e.g. $500 alarm
which reduced probability of fire dmg by 0.5%

RRL = (1% of $200k - 0.5% of $200k)/$500 = 2
RRL > 1.00 *therefore worth doing*

#### The risk of delays in completing activities, examples.
| Risk |
| ---- |
| Personell shortfalls |
| **Unrealistic time and cost estimates** |
| Developing the wrong software functions |
| Developing the wrong user interface |
| Gold plating |
| Late changes to requirements |
| Shortfalls in externally supplied components |
| Shortfalls in externally performed tasks |
| Real time performance problems |
| Development technically too difficult |

#### METHOD: Using PERT 
**PERT = Program Evaluation and Review Technique**
**PERT - A statistical tool for analysing completion time**

##### Method
Three estimates are produced for each activity (task)

* (m) Most likely time
* (a) Optimistic time
* (b) Pessimistic
* (t\_e) 'expected time' t\_e = (a +4m +b)/6
* (S) 'activity standard deviation' S = (b-a)/6

##### Calculations
Suppose the dependecies are as such:
```
 ______      ______      ______              
|TASK A| -> |TASK B| -> |TASK C|               
 ¨¨¨¨¨¨      ¨¨¨¨¨¨      ¨¨¨¨¨¨
```

| Task | a | m | b | t_e | s |
|------|---|---|---|-----|---|
|  A   | 10| 12| 16| 13  | 1 |
|  B   | 8 | 10| 14| 10  | 1 |
|  C   | 20| 24| 38| 26  | 3 |
|A+B+C |   |   |   | 49  | 3 |

The calculations are completed. Just use the previously mentioned formulae if
you want to review them.

##### Assessing the likelihood of meeting a target

* Imagine now that the target for completing A+B+C was 52 days.
* Calculate the Z-value as (T - t\_e)/s = (52 - 48.65) / 3.32 = 1.01 
* Look the Z-value up on the table of Z-values (not included)

Which results in a 15% chance of **NOT** meeting the target 52 days.
And that's PERT for you, kids!

#### Problems with estimates of task duration
* Estimators usually add a safety zone to cover difficulties
* Developers work to the estimate, meaning the time is lost
* No advantage is taken of opportunities where tasks can finish early - and
  provide a buffer for later activities

> Parkinson's law: 
>
> Work expands so as to fill the time available for its completion
>
> => All buffers are usually consumed by end of the project.

#### Basic Ideas of Critical Chain
To reduce time wasted, a critical chain is constructed as such:

```
 _____ __
|_____'__| ____ __
          |____'__| ___ __
                   |___'__|
```

Move all buffers to the end and halve them.


```
 _____
|_____| ____ 
       |____| ___ ___
             |___'___|
```

Thus, the buffers have been reduced in half so that people don't waste time!!!


#### Critical Chain Approach

1. Ask the estimators for two estimates
 * Most likely duration: 50% chance of meeting this
 * Comfort zone: additional time needed to have 95% chance
2. Schedule all activities using most likely values and
starting all activities on latest start date

* “Critical chain” the same as “critical path” but resources
also considered
* Put a project buffer at the end of the critical chain with
duration 50% of sum of comfort zones of the activities
on the critical chain
* During project execution monitor how much of the
buffer that has been used
* Supported in tools, e.g. through add-on to MS Project


#### Executing  and monitoring Critical Chain plans

* Principle: focus your efforts - ”multitasking is evil”
  * No chain of tasks is started earlier than
    scheduled, but once it has started is finished as
    soon as possible
  * This means the activity following the current one
    starts as soon as the current one is completed,
    even if this is early – the relay race principle
* Fever charts are used to monitor progress and catch tasks at risk
