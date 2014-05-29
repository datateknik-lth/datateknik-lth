Software Process Improvement
============================

* Why focus on processes?
  * Processes affect **product quality**
  * Processes affect **people**, **schedule** and **technology**
  * Software is more design intense => people dependent

Software processes are different from manufacturing processes in that:

* Manufacturing is *repeatable* -- the same item is produced many times, while
  software is *unique* -- it is written only when nothing similar exists.
* Manufacturing is *well-defined* -- the specification of the output is clearly
  defined before the process starts, while software is *incomplete & evolving*
  -- requirements are sketchy from the start and also likely to change during
  the development cycle.
* Manufacturing is *known* -- the process between input and output is clearly
  known and can be done repeatedly, while software is *unknown* -- it is based
  on new technologies, new interfacing requirements etc.
* Manufacturing is based on *machines & tools* -- the process' efficiency is
  mostly dependent on the quality of the machines and less on the operators,
  while software development is based on *people* -- knowledge, experience and
  skill of people can make huge differences in productivity.

## Process Management for Software
* **CMMI:** Capability Maturity Model Integration, software certification
  similar to ISO
* **PSP:** Personal Software Process
* **TSP:** Team Software Process

### Personal Software Process
> The PSP aims to provide software engineers with disciplined methods for
> improving personal software development processes.

* Goes from PSP0 => PSP2.1
* PSP0, PSP0.1: Introduces process discipline and measurement
  * 3 phases: planning, development and post mortem
  * Baseline established: time spent programming, faults injected/removed, size
    of program
  * In PSP0.1 a coding standard is introduced, size measurements and PIP
  * PIP - engineer establishes a personal improvement plans and records ideas on
    self-improvement
* PSP1, PSP1.1: Introduces estimating and planning
  * Based on the baseline established in PSP0 the engineer prepares a test
    report. Data used is accumulated from the baseline data and used to estimate
    total time.
  * Each new project will record actual time spent, this information is used for
    task schedule planning. (PSP1.1)
* PSP2, PSP2.1: Introduces quality management and design
  * PSP2 adds two new phases: design review and code review. Defect prevention
    and removal are the focus at the PSP2. Engineers learn to evaluate and
    improve their process by measuring how long tasks take and the number of
    defects they inject and remove in each phase of development. Engineers
    construct and use checklists for design and code reviews. PSP2.1 introduces
    design specification and analysis techniques

### Team Software Process

Before engineers can participate in the TSP, it is required that they have
already learned about the PSP, so that the TSP can work effectively. Training is
also required for other team members, the team lead, and management.

The TSP software development cycle begins with a planning process called the
launch, led by a coach who has been specially trained, and is either certified
or provisional. The launch is designed to begin the team building process, and
during this time teams and managers establish goals, define team roles, assess
risks, estimate effort, allocate tasks, and produce a team plan. During an
execution phase, developers track planned and actual effort, schedule, and
defects, meeting regularly (usually weekly) to report status and revise plans. A
development cycle ends with a Post Mortem to assess performance, revise planning
parameters, and capture lessons learned for process improvement.

The coach role focuses on supporting the team and the individuals on the team as
the process expert while being independent of direct project management
responsibility. The team leader role is different from the coach role in that,
team leaders are responsible to management for products and project outcomes
while the coach is responsible for developing individual and team performance.

## Software process improvement

1. Evaluation of current practices
1. Planning for improvements
1. Imlementing improvements
1. Evaluation of effects

## The Deming Cycle - PDSA

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

These steps are also known as the "*General Steps for SPI*"
(Software process improvement)

* Study - Study/Check/Assess the outcome; measure and report
* Act - Decide on needed changes -> repeat
* Plan - Plan goal & process design/revision to improve results
* Do - Implement plan & measure performance

## SPI approaches

### Prescriptive
Top-down approaches (general -> specific)

Examples: CMMI, SPICE

### Inductive
Bottom-up approaches (specific parts -> general)

Examples: QIP, iFLAP, Lean Six Sigma

* Process modelling and simulation
* Information flow analysis
* Retrospective reflection aka Lessons learnt, project post-mortem

### Lean Six Sigma
* **Focus:** elimination of waste in the process flow (LEAN)
* **Combination** of **LEAN** and **Six Sigma**
  * *Lean:* Toyota productions, eliminate waste, quality
  * *Six Sigma:* Motorola (1986) 99.99966% of products statistically expected
    to be free of defect (6*σ)
* A process for process improvement
* LSS 'belts' - training and certification

#### LSS Process for Process Improvement (yo dawg I heard you liek process improvement in your process improvement)

```
Entry     * Prepare charter, sponsor, team and leader
  |
  V
Define    * The problem
  |       * The relevant process
  V       * Customer critical aspects
Measure   * Current performance
  |
  V
Analyze   * Data and process
  |       * Identify root causes
  V
Improve   * Process w solutions
  |
  V
Control   * Ensure targets met over time
  |
  V
Exit      * Share results, benefits and lessons learnt
```
__Define__: input, process factors, output
__Measuring__: Lead time, customer satisfaction, cost per customer, competence
level etc
__Analyze__: root cause analysis, "5 Why?", identify improvement
__Improve__: implement
__Control__: remeasure, continously assess

##### Retrospective Analysis
* Consider the past in order to identify problems and improvements - individua,
  but mostly in groups
* Often applied after project completion
* Important SPI method for self-governing agile teams
  * Sprint (iteration) retrospectives
* **Benefits**: Team learning & improvements, widen perspectives & insight into
  bigger picture
* **Challanges**: taking the time together, remembering (correctly and uniformly),
  risk of incorrect conclusion for pure experience based retros

__Evidence-Based Timeline Retrospectives__
A PM extracts *evidence* from the project, i.e. notes, tasks, estimations etc,
to form a Timeline. The team, or parts of the team, are then invited to review
the timeline. This gives a chance for reflection and stimulates discussion
around the project. It also gives the team a chance to jointly identify issues
and solve them in a positive manner. The aim of the meeting is to further
analyze how different events and actions influence each other with the aim of
identifying practices that work or that need improvement.

Roles: Moderator (leading discussion and creating positive atmosphere),
co-moderator (basically secretary), team member (discusses and evaluates)

### CMM & CMMI
Capability Maturity Model for Software (SW-CMM)

* Mission to promote software technology transfer, particularly to defense
  contractors
* Maturity model proposed in mid-80s and later refined to __CMMI__ in early 90s
* Work has been very influential in process improvement

CMMI was introduced to bring together models produced for different environments
into a single integrated framework. These models place organizations at one of
five levels of process maturity which indicate the sophistication and quality of
their production practices. These levels are defined as follows.

#### Structure

* Maturity Level: indicate capability and contains Key Process Areas
* Key Process Areas: goals and common features
* Common Features: addresses implementation and contains Key Practices
* Key Practices: describes infrastructure and activities

#### Maturity Levels

* **Level 1** *Initial*: The procedures followed tend to be haphazard. Some
  projects may be successful, but this tends to be because of the skills of
  particular individuals, including project managers. There is no level 0 and
  so any organization would be at this level by default.
  * Frequently difficulties in making commitments
  * Crises common
  * Success depends entirely on having exceptional managers and developers
  * Level 1 companies, however, can deliver products

  __Key Process Areas__
  * None, initial level
* **Level 2** *Managed (Repeatable, in slides)*: Organizations at this level
  will have basic project management procedures in place. The way, however,
  individual tasks are carried out will depend largely on the person doing it.
  * Policies for managing software projecs are implemented
  * Realistic commitments
  * Capability: disciplined, earlier successes can be repeated

  __Key Process Areas__
  * Configuration management
  * Software QA
  * Subcontract management
  * Project tracking and oversight
  * Project planning
  * Requirements management
* **Level 3** *Defined*: The organization has defined the way that each task in
  the software development life cycle should be done.
  * A typical process for developing and maintaining software in the
    organisation is defined
  * A Software Engineering Process Group (SEPG) is defined
  * Capabilitiy: standard and consistent - both software engineering and
    management are stable and repeatable

  __Key Process Areas__
  * Organization process def
  * Peer reviews
  * Training program
* **Level 4** *Quantitatively managed*: The products and processes involved in
  software development are subject to measurement control.
  * The organization sets quantitative quality goals for both products and
    processes
  * Software products are of high predictable quality
  * Organization-wide metrics database
  * Meaningful variations can be distinguished from noise
  * Capability: predictable

  __Key Process Areas__
  * Software quality management
  * Quantitative process management
* **Level 5** *Optimizing*: Improvement in procedures can be designed and
  implemented using the data gathered from the measurement process.
  * The whole organization is focused on continous process improvement
  * The organisation has the means to identify process weaknesses and take
    actions
  * Cost benefit analysis possible

  __Key Process Areas__
  * Process change management
  * Technology change management
  * Defect prevention

The evaluation is performed by a team of assessors coming into the organization
and interviewing key staff about their practices, using a standard questionnaire
to capture the information. A key objective is not just to assess, but to
recommend specific actions to bring the organization up to a higher level.

* Contains 25 process areas, e.g. requirements management, quality assurance etc
* Each process area contains goals and practices
* Two types of models
  * Staged: grades the overall development process
  * Continous: grades each process area

### SPICE

Software Process Improvement Capability dEtermination model

* Developed from CMM
* Parts of SPICE defined as ISO standard
* Consists of:
  * Process dimension: assessment per process area
  * Capability dimension: how processes are impl and managed
* Particularly appropriate for small organisations (ability to focus on process
  areas)

## Process Modelling

* Map & Understand
* Facilitate group communication
* Process guidance and tool support for process flows

## Simulating processes

* What-if analysis
* Measuring of flow for different alternatives
* Requires tool support

## Information Flows

* Focuses on flow and transformation of information e.g. requirement changes to
  testers, tech dep vs comm flow (?)
* Used to identify bottlenecks, missing connections, information brokers (key
  nodes)
* Social network analysis often applied

## Change requires...

* Commitment from management
* Support & training
* Staff involvement
* Measurable goals

## SMART Goals

* Specific - who, what, when, where, why, how?
* Measurable - How will you know when you're done?
* Attainable - Is this realistic?
* Relevant - How does this relate to current situation & visions for future?
* Time-bound - what's the deadline?
