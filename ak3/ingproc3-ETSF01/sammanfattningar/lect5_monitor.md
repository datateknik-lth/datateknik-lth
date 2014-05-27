# Monitor & control 

Monitor & control is needed since plan != reality.
By using this the aim is to reach
* Goals: good product
* Budget: cost
* Timelineness: market window

## Monitor

* Objective: check if project is on track with plan
* Different kinds of data/measurements
..* Data from reports
..* Subjective data on completion rate
..* Data comparing actual cost/value and planned cost/value

### Cost vs Time
*Behind time* but *under budget*, ex: delayed due to not
deploying committed staff
On time but *over budget*, ex: additional resources have
been added to cope with work load.

### Collecting the data
* Time sheet: Report hours, percentage done, etc.
* Red/amber/green (RAG) reporting: Simply chose the color of
likelihood to reach deadline of specific task. Do this for every
week/day etc.

### Visualizing
* Gantt chart: Basically multiple activity bars, indicating
when a task should be started and done, as well as the current
progress. Preferably the progress of the bar should be aligned
with *today*.
```
|                  TODAY         |
|--DATE-| 12 | 13 | 14 | 15 | 16 |
Task A:      |====>_________|
Task B: |==============>_________|
Task C: |=============>|
```
Where *Task A* is behind schedule, *Task B* is on schedule but
not done, and *Task C* was completed on schedule.

* Slip chart: A Gantt chart with a vertical line showing the
progress.

```
|                  TODAY         |
|--DATE-| 12 | 13 | 14 | 15 | 16 |
                    |
                   /
Task A:      |====>_________|
                   \
                    |
                     \
                      \
Task B: |==============>_________|
                      /
                     /
                    |
                     \
                      \
Task C: |=============>|
```

* Brigette's timeline plots planned time along the horizontal
axis and elapsed time along the vertical axis. A diagonal line
means that the task was delayed, a dot/star means the task is
complete.

```      Task A  Task B Task C
| T | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| 1 | .       |       |   |
| 2 |     .   |        \  |
| 3 |         *         \  \
| 4 |             .     |   \
| 5 |                 . |    \
| 6 |                   * . 
| 7 |                         .
```
Where *Task A* was finished on schedule, *Task B* was
delayed but is finished. *Task C* was delayed even more and
is still incomplete.
