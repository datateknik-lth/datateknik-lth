# Software metrics

> You cannot control what you cannot measure

[some random dude named Tom DeMarco 1986]

* SW project management
  * Estimate cost/effort based on historical data
  * Monitor project progress & risks
* Software quality – product quality status
* SW process improvement – process efficency & quality

All of these require decision support!

## Examples
* Products
  * Lines of code: sw size, impl efficiency
  * Size of requirements specification
  * Complexity of design
  * Test coverage of code
* Processes
  * Actual implementation time
  * Average time for issue resolution
  * Number of issues submitted by testers
  * Effort spent in design phase
* Resources
  * Price of software components
  * Experience of staff

## Objective or subjective measurments
* Objective
  * Lines of code
  * Actual implementation time – source: reporting system
  * Module complexity – cyclomatic complexity
* Subjective
  * Experts or questionnaires with Likert scales (ordinal)
  * Complexity of system
  * Usability of system

## Scales
* Nominal scale – The nominal type, sometimes also called the qualitative type, 
  differentiates between items or subjects based only on their names or categories 
  and other qualitative classifications they belong to. Ex. Gender or language.
  * type of fault = {data, function, interface, …}
* Ordinal scale – The ordinal type allows for rank order (1st, 2nd, 3rd, etc.) 
  by which data can be sorted, but still does not allow for relative degree of difference between them. 
  * criticality of fault = critical > important > medium > low
* Interval scale – The interval type allows for the degree of difference between items, 
  but not the ratio between them. Ex. direction measured in degrees from true or magnetic north.
  * end time = date
* Ratio scale – The ratio type takes its name from the fact that measurement is the 
  estimation of the ratio between a magnitude of a continuous quantity and a unit 
  magnitude of the same kind. A ratio scale possesses a meaningful (unique and non-arbitrary) 
  zero value. Most measurement in the physical sciences and engineering is done on ratio scales. 
  * duration = days

### Scales: allowed usage
* Nominal scale: labelling, classifying entries
* Ordinal scale: order entries
* Interval scale: relative distance between entries
* Ratio scale: relative size


