# Activity planning

> Time is natures way of stopping everything happening at once.

## The objectives of activity planning
- Feasability assessment
  * Is the project possible within the required timescales and resources?
- Resource allocation
  * What are the most effective ways of allocating resources? When should
    the resources be available? 
- Detailed costing
 * How much will the project cost? After producing an activity plan, we can
   obtain more detailed estimates of costs.
- Motivation
 * Providing targets and monitoring progress can motivate staff.
- Coordination
 * When do the staff need to be transfered between projects to increase 
   efficiency?

## Activity networks

 ```
           ____  
          |____| 
    ____ /      \ ____
-->|____|        |____|-->
         \ ____ /
          |____|
 ```

 Activity networks can be used to assess the feasability of the projects completion
 date, identify when resources are needed, calculate when costs incur, and to coordinate
 the staff between tasks.

## Defining activities
  
  An activity includes:

  * Start and end-time
  * Resource requirements
  * Duration
  * Dependencies

## Identifying activities

  There are three approaches to identifying the activities or tasks:

  - Activity based planning
   * Creating a list of all the activities that the project needs. Can be done by creating 
     a **Work Breakdown Structure** (WBS, filled with verbs). This involves identifying the main tasks that are 
     needed for the project and then breaking them down into lower-level tasks. Too great depth
     will result in a large number of small tasks that will be diffcult to manage. Too shallow
     project provides insufficient detail.

  - Product-based approach
   * Consists of producing a **Product Breakdown Structure** (PBS, filled with nouns) and a **Product Flow Diagram** (PFD).
     The PFD idicates for each product which other products are required as inputs. With the help of a 
     PFD you can easily create an ordered list of activities by identifying the order of products and
     which acitivies are needed for them.

  - Hybrid approach
   * The hybrid approach is a mix of both. Instead of creating a WBS that is based on the projects 
     activities, you create a WBS that is based on the projects products.

## Network planning models
  
  - Program Evaluation Review Technique (PERT)
   * Activity on arrow
  - Critical Path Method (CPM)
   * Activity on arrow
  - Precedence network
   * Activity on node

## Rules for project networks:
  
  * Should have only one start node.
  * Should have only one end node.
  * Every node has a duration.
  * Links normally don't have a duration.
  * Precedence are the immediate preceding activities.
  * Time moves from left to right.
  * A network may not contain loops.
  * No dangling activities.

## Lagged activities
  
```
   ____        ____        ____                                     
  |____|----->|____|----->|____|                                                
            1/ ____ \2                                 
             \|____|/                                   
```

Lagged acitivites are dependent on other activities but are initiated with a lag. In the above
example, the second-row activity is started 1 day after the dependent activity and completed 
2 days after the dependent activity has completed.

## Start and finish time of activities

  * Earliest start (ES)
  * Earliest finish (EF) = ES + duration
  * Latest finish (LF) = latest task that can be completed without affecting project end.
  * Latest start = LF - duration

## Forward and backward pass

  - Forward pass
   * A forward pass calculates the earliest dates on which each activity may be started and completed.
   * It does this by going through the dependencies from start to finish and sorting the activities
     accordingly.
  
  - Backward pass
   * A backward pass calculates the latest date at which each activity may be started and completed.
   * It does this by going backwards and looking at the duration of each activity.

## Critical path and float

The float of an activity is defined as the difference between its earliest start date and latest start date
(or earliest finish - latest finish).
It is a measure of how much the start or completion of an activity may be delayed without
affecting the end of the project.

   - Free float
    * The time by which an activity may be delayed without affecting any subsequent activities.
   - Interfering float
    * The difference between total float (Vad är total float, berätta för mig / Andrée) and free float. Indicates how much the activity can be
      delayed without delaying the project end date.

The critical path shows the path of activities in a project that define the duration of the whole
project. Any delay in these activities will delay the whole project, which means these activities
have no float.

If a project duration needs to be reduced it is the critical path that needs to be shortened. 
