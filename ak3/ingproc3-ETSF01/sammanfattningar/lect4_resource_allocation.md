# Lecture 4 - resource allocation

In general:

How labor, equipment, space etc. should be distributed to acquire the highest possible efﬁciency.
Performed after activities, effort, and risks have been identified.

* The right amount of people for each job.
* The right amount of work for each employee.


## Schedules
* Activity schedules

   Indicating start and completion dates for each activity.
* Resource schedule

   Indicating dates when resources needed and the levels of available resources.
* Cost schedule

   Showing accumulative costs, total spending over time.

## Resource allocation
* Resource types
  * Includes labour, equipment, materials, space, services etc.
  * Time (duration)

     Can often be reduced by adding more staff.
  * Money

     Used to buy other types of resources.

### Allocation step by step
1. Identify resources needed and create a resource requirements list.
2. Identify resource types, resources within a group are interchangeble, and resources between groups are not.
3. Allocate resource types to activites, and examine each resource type histogram.
4. If resources needed exceeds the available resources at some time, perform resource smoothing.

* Resource histograms, where the first is before resource smoothing. Available resources are the dotted line, 
  and the required are shown with lines.
```
                       ___
|5|            ___    |   |
|4|....___....|...|...|...|___.....
|3|___|   |___|   |___|   |   |
|2|   |   |   |   |   |   |   |
|1|   |   |   |   |   |   |   |
  | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
```

```
|5|
|4|....___.....___.....___.___.___.
|3|___|   |___|   |___|   |   |   |
|2|   |   |   |   |   |   |   |   |
|1|   |   |   |   |   |   |   |   |
  | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
```

### Resource clashes
Occurs when the same resource is needed in more than one place at the same time.
Can be resolved by delaying one activity and taking advantage of the float time, 
or if that is not possible, push back project completion.
Could also be resolved by taking resources from a non-critical activity, 
or by bringing in additional resources - increases cost.

### Prioritizing

When prioritizing between two competing activities, there are two ways of doing this.
* Total float priority - Those with the smallest float have the highest priority.
* Ordered list priority - Takes account the duration of an activity, as well as the float, see Burman's.

#### Burman's priority list
1. Shortest critical activities
2. Other critical activities.
3. Shortest non-critical activities.
4. Non-critical activities with least float.
5. Non-critical activities.

### Resource usage
Need to... 
* maximise %usage of resources = reduce idle periods between tasks.
* balance costs against early completion date.
* allow for contingency.

```
          /\
Target   /  \   Cost/
scope   /    \  effort
       /      \
      /________\
       lead time
```
