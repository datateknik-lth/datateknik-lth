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
                     /
                    /
                   /
Task A:      |====>_________|
                   \
                    \
                     \
                      \
Task B: |==============>_________|
                       |
                       |
                       /
                      /
                     /
Task C: |==========>|
```

* Brigette's timeline plots planned time along the horizontal
axis and elapsed time along the vertical axis. A diagonal line
means that the task was delayed, a dot/star means the task is
complete.

```
         Task A  Task B Task C
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

* Burn-Down Charts (Scrum): A chart displaying the ideal velocity
of the project, and a line displaying the actual progress.

```
| T | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| 1 | . ___
| 2 |     .\
| 3 |       \ .
| 4 |        \__  . 
| 5 |           \_____.___ 
| 6 |                     .\ 
| 7 |                       \_.
```

The dots represent the ideal veolocity, the lines the actual.

* Fever chart (critical chain). The upper part indicates
that the project most likely will be late, the lower part
that the project will finish early, and the middle that
it is on schedule.

```

* * * * * * * * * * * * * * * -
* * * * * * * * Y * * *       -
* * * * * * * Y * *         - -
* * * * * * Y Y *         - - -
* * * * * Y Y *  K      - - - -
* * * * * Y    K      - - - - - 
* * * * Y Y K K     - - - - - - 
* * *   Y K       - - - - - - - 
*     K Y       - - - M M - - - 
    K   Y     - - M M - - - - - 
  K     Y   - - M - - - - - - - 
K     Y   - M M - - - - - - - - 
  Y Y M M M - - - - - - - - - -
M Y M - - - - - - - - - - - - - 
Y Y - - - - - - - - - - - - - - 
Y - - - - - - - - - - - - - - -
Y - - - - - - - - - - - - - - - 
```

Where *Y* is late, *K* is on schedule, and *M* is early.

### Earned value analysis
Earned value analysis is based on assigning a "value" to each
task or work, based on the original expenditures forecasts.

* Planned value (PV) or Budgeted cost of
work scheduled (BCWS): Original estimate
* Earned value (EV) or Budgeted cost
of work performed (BCWP): Work completed this far
* Actual cost (AC) or Actual
cost of work performed (ACWS): Actual work performed this far
* Budget at completion (BAC): The budget when the project is done
* Estimate at completion (EAC):
Estimated budget at completion, updated as the project progresses

### Earned value tracking
When the baseline budget has been established, the project can be tracked
as it progresses.

* Schedule variance (SV): EV - AV. Difference between the estimated
and actual value.
* Time variance (TV): Difference between planned finish date and actual.
* Cost variance: EV - AC. Indicates the difference between the earned value
and the actual cost. A negative CV means that the project is over cost.

### Performance ratios
Value for money.

* Cost performance indicator (CPI) = EV / AC
* Schedule performance indicator (SPI) = EV/PV

### Example

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

### Prioritizing monitoring
Focus on monitoring based on risk
* Critical path activities
* Activities with no free float
* Activities with less than a specified float
* High risk activities
* Activities using critical resources
* Activities with external dependencies

## Control
Almost any project will be delayed at some point, the project
manager must recognize when this is happening and take immediate action! **dum dum!**


