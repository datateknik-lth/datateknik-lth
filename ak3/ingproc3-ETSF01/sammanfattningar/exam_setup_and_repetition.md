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

Expected time (t\_e) = (minimum time (a) + 4 * medium time (m) + worst time (b)) / 6
Standard deviation (S) = (worst time (b) - minimum time (a))/6

## Activity planning (WIP)


### Identifying activities

  There are three approaches to identifying the activities or tasks:

  - Activity based planning (**WBS**)
   * Creating a list of all the activities that the project needs. Can be done by creating 
     a **Work Breakdown Structure** (WBS, filled with verbs). This involves identifying the main tasks that are 
     needed for the project and then breaking them down into lower-level tasks. Too great depth
     will result in a large number of small tasks that will be diffcult to manage. Too shallow
     project provides insufficient detail.

  - Product-based approach (**PBS**)
   * Consists of producing a **Product Breakdown Structure** (PBS, filled with nouns) and a **Product Flow Diagram** (PFD).
     The PFD idicates for each product which other products are required as inputs. With the help of a 
     PFD you can easily create an ordered list of activities by identifying the order of products and
     which acitivies are needed for them.

  - Hybrid approach
   * The hybrid approach is a mix of both. Instead of creating a WBS that is based on the projects 
     activities, you create a WBS that is based on the projects products.

### GQM (Goal, Question, Metric) 

* Conceptual level (goal) 
 * A goal is defined for an object, for a variety of reasons, with respect to various models of quality, from various points of view and relative to a particular environment.
* Operational level (question) 
 * A set of questions is used to define models of the object of study and then focuses on that object to characterize the assessment or achievement of a specific goal.
* Quantitative level (metric) 
 * A set of metrics, based on the models, is associated with every question in order to answer it in a measurable way. 
 

Precedence Networks
Diff floats, ES, EF, LS, LF, Critical Paths!!!


## SPI (Lecture 3)


### The deming cycle. 
PDSA ÄR EN ONÖDIG FÖRKORTNING

PDSA = Plan Do Study Act

PUMA ÄR EN SVENSK VERSION AV PDSA

PUMA = Planera Utför Mstudera Agera

```
         , - ~ ~ ~ - ,
     , '       |       ' ,
   ,           |    Act    ,
  ,    Study ->|     |      ,
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


## Resource Allocation (Lecture 4)
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

## Monitor (Lecture 5)

### Earned value analysis

#### Basics 
Earned value analysis is based on assigning a "value" to each task or work, based on the original expenditures forecasts.

* Planned value (PV) or Budgeted cost of work scheduled (BCWS): Original estimate
* Earned value (EV) or Budgeted cost of work performed (BCWP): Work completed this far
* Actual cost (AC) or Actual cost of work performed (ACWS): Actual work performed this far
* Budget at completion (BAC): The budget when the project is done
* Estimate at completion (EAC): Estimated budget at completion, updated as the project progresses

#### Performance ratios

Value for money.

* Cost performance indicator (CPI) = EV / AC
* Schedule performance indicator (SPI) = EV/PV
* Estimated Actual Cost = BAC / CPI    

#### Example 
```
BAC = 100
Actal cost = 80
|===========>        |
    EV = 60 ^        ^ PV = 100
```

* CPI = EV / AC = 60 / 80 = 75 % => over budget
* SPI = EV / PV = 60 / 100 = 60 %
* EAC = BAC / CPI = 100 / 0.75 = 133

* Cost variance = EV - AC = 60 - 80 = -20
* Budget variance = PV - AC = 100 - 80 = 20
* Schedule variance = EV - PV = 60 - 100 = -40

## Cost Benifit Evaluation (Lecture 6)
* **Return on investment (ROI) or also known as Accounting rate of return (ARR) 
  = Net profit / total investment.** 
  *Also useful for company individual choices
  or features.*
* **Net profit:** 
  - total income - total cost
* **Payback period:** 
  - time to break even

```
      average annual profit
ROI =---------------------- X 100
        total investment

        value in year t
NPV =----------------------
            (1 + r)^t
```

