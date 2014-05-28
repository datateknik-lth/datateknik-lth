# Exam setup and repetition
A quick non-thorough repetition of all the great material. 
## Risk Management (Lecture 1)
Some examples of methods used in risk management, for a more thorough explanation, see Lecture 1.
### Casual mapping (Applied example)
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

### Probability Impact Matrix
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

### Decision Trees
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

### PERT (Program Evaluation and Review Technique)

Expected time (t\_e) = (minimum time (a) + 4 * medium time (m) + worst time (b) / 6
Standard deviation (S) = (worst time (b) - minimum time (a))/6

## Activity planning (WIP)


## SPI (Lecture 3)


### The deming cycle. 
PDSA ÄR EN ONÖDIG FÖRKORTNING

PDSA = Plan Do Study Act

PUMA ÄR EN SVENSK VERSION AV PDSA

PUMA = Planera Utför Mstudera Agera

```
         , - ~ ~ ~ - ,
     , '       |       ' ,
   ,        -> |    Act    ,
  ,    Study   |     |      ,
 ,             |     v       ,
 ,-------------|-------------,
 ,       ^     |             ,
  ,      |     |<-  Plan    ,
   ,    Do     |           ,
     ,         |        , '
       ' - , _ _ _ ,  '

```

* Study - Study/Check/Assess the outcome; measure and report
* Act - Decide on needed changes -> repeat
* Plan - Plan goal & process design/revision to improve results
* Do - Implement plan & measure performance


## Resource Allocation 
A resource includes labour, equipment, materials, space, services etc.
### Allocation step by step
1. Identify resources needed and create a resource requirements list.
2. Identify resource types, resources within a group are interchangeble, and resources between groups are not.
3. Allocate resource types to activites, and examine each resource type histogram.
4. If resources needed exceeds the available resources at some time, perform resource smoothing.

* Resource histograms, where the first is before resource smoothing. Available resources are the dotted line, 
  and the required are shown with lines.
```
Resource
need                   ___
|5|            ___    |   |
|4|....___....|...|...|...|___.....
|3|___|   |___|   |___|   |   |
|2|   |   |   |   |   |   |   |
|1|   |   |   |   |   |   |   |
  | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
              Week
```

```
|5|
|4|....___.....___.....___.___.___.
|3|___|   |___|   |___|   |   |   |
|2|   |   |   |   |   |   |   |   |
|1|   |   |   |   |   |   |   |   |
  | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
```




