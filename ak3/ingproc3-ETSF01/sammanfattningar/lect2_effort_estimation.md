Effort Estimation
=================

## Problems with Effort Estimation
 Subjective nature of estimating

* Difficult to produce evidence in support of decision
  * these bring uncertainties, especially in the early days when there is a
    'learning curve'
* Projects differ
  * Experience on one project may not be applicable to another
* Political pressure
  * Managers may wish to reduce estimated costs in order to win support for
  acceptance of a project proposal
* Covering your own back
  * Avoid later overtime

## Effort or Cost?

```
Effort == work required e.g. person/man-hours
```

__Cost includes:__
* Person-hours (salaries, benefits)
* Moving and living costs for new staff members
* Training
* Travel costs
* Legal & Licensing fees (software, patents, copyright)
* Contractors and subcontractors
* Equipment
* Currency exchange rates
* Marketing & Advertising
* Inflation rate

## Over- and under-estimating

### Parkinson's Law
> Work expands to fill the time available

### Brooks's
> Putting more people on a late job makes it later

### Weinberg's Zeroth Law of reliability
> a software project that does not have to meet a reliability requirement
> can meet any other requirement

# SVENSKA INCOMING
**Vad betyder då den här lagen? Jo det ska ni få veta! (Brace yourselves) Lagen
innebär att ifall projektet inte har en tydligt specificerad krav på 
tillförlitlighet när det ska skeppas så kan detta arbiträrt väljas. Vilket
resulterar i sämre kvalitet som sedan visas i __testning__ eller senare faser.**

* Over-estimations => project likely to take longer
* Under-estimations => lower quality in order to meet target

## When & Why
* Strategic planning
* Feasability study
* Requirements spec
* Evaluation of suppliers' proposals
* Project planning

## What don't we know?
* Customers' needs & expectations - requirements
* Technical complexity & design components
* Reuse - internal and external components
* People
  * Skills, competence and experience
  * Co-operation & communication
* ... (srsly wtf, why the dots here grrl?)

## Bottom-up versus top-down estimation

### Bottom-up
* Identify all tasks that have to be done (top-down)
* Estimate tasks of 1-2 mw, accumulate effort bottom-up
* Time consuming
* Useful when no past project data for similar projects exist

### Top down
* Produce overall estimate based on project cost drivers
* Based on past project data
* Divide overall estimate between jobs done

```
effort = (system size) * (productivity rate)
```

## Estimation methods
* Analogy: case-based, comparative (from previous projects etc)
  * Look at previous similar tasks, base estimation from diff/error
* Parametric or algorithmic models, e.g. function points COCOMO
* Expert opinion - just guessing?
* Parkinson and 'price to win' - opportunistic estimates!

## Basis for successful estimation
* Information about past projects
  * Need to collect performance details about past project
* Need to be able to measure the amount of work involved
  * Traditional size measurement for software is 'lines of code' - ain't good

## Stages: Identify
1. Significant features of the current project
1. Previous project(s) with similar features
1. Base effort on previous similar project. Consider
  1. Differences between current and previous projects
  1. Possible reasons for error (risk)
  1. Measures to reduce uncertainty

## Algorithmic estimation
Estimates based on historical data in the form of measurements from earlier
projects, typically `effort = c * size^k`

Example:
```
size = lines of code
1/c  = productivity //e.g. lines of code per day
```

* Objective, but good estimate requires
  * Good experience base
  * Good size estimate

## Parametric Models 
Used in top-down approaches. Productivity factors are used
as parameters. A parametric model normally has formulae in the form

    effort = (system size) * (productivity rate)

where system size may for example be measured in KLOC (kilo-lines of code) or
function points and productivity rate in days per KLOC.

Some parametric models are focused on system or task size, while others like
COCOMO focus on productivity factors.

### Function Points - Albrecht/IFPUG FP
Models system size

```
UFP* = SUM(i=1..15, n items of weight i * weight)
FP   = UFP * "technical complexity factor"
```

#### Albrecht function point analysis
* Top down method developed by Allan Albrecht, IBM.
* Information systems comprised of five *external user types*:
  * *External input types* - input transactions which update internal computer
    files
  * *External output types* - transactions where data is output to the user
  * *External inquiry types* - transactions initiated by the user, which provide
    information but do not update internal files
  * *Logical internal file types* - are the standing files (or datastore) used
    by the system.
  * *External interface file types* - allow for output and input that may pass
    to and from other computer applications
* A table consists of "low", "medium" and "high" complexity numbers for the
  above listed points. The amount of items in each category is then multiplied
  by its counterpart in the table. The weighted sum of these are the Albrecht FPs.

### COCOMO (COnstructive COst MOdel)
Developed by Barry W. Boehm. Focuses on productivity factors. The first version (COCOMO81) used the formula

    effort = c * size^k

where effort is measured in person-months and size in KLOC. c and k are
constants that depend on the system being developed. The exponent k is selected
to cause larger projects to require disproportionately more estimated effort
than smaller ones in the es, as larger projects are often found to be less
productive in practice.

In COCOMO II there are models for estimates at three different stages in a project; *Application composition (inception)*, *Early design (elaboration)* and *Post architecture (construction)*. The core model is now

    pm = A(size)^(sf) * (em_1) * (em_2) * ... * (em_n)

where A is a magical constant and sf, the scale factor, depends on the following *exponent driver ratings*:

* Precedentedness (PREC)
* Development flexibility (FLEX)
* Architecture/risk resolution (RESL)
* Team cohesion (TEAM)
* Process maturity (PMAT)

These ratings are estimated on a six level scale ranging from *very low* to
*extra high*. From this guesstimation a table provides a numerical magical
constant.

em\_1..em\_n are *effort multipliers*. A wide range of standard effort
multipliers are defined in COCOMO II for every development stage along with
corresponding magical constant.

### Expert judgement

Ask an important looking person to pull a suitable guesstimation out of his
pocket. Research show that expert judgement in practice often is based on
*analogy*.[citation needed]

How to? First, find the right people (people with experience from similar
products and processes). Then, ask the right questions (present context and
goals, be specific about resource restrictions). Finally, ensure the experts
have time to think about it.
