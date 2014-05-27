# Agile project management

Agile is a name for many different methods, each of these implementation is unique. 
The included methods are Scrum, XP, and Kanban.

## The Agile manifesto
* **Individuals and interactions** over processes and tools
* **Working software** over comprehensive documentation
* **Customer collaboration** over contract negotiation
* **Responding to change** over following a plan

## Agile projects

Traditional development:
```
|Requirements->|Design->|Implementation->|Testing->| Done!
```
Agile development:
```
|R->|D->|I->|T->|
                |R->|D->|I->|T->|
                                |R->|D->|I->|T->| 
                                                  Done!
```

Agile focuses on...
* Maximizing return on investment (ROI), delivering business value.
* Quickly delivering working code.
* _Expecting_ and managing changes.

Agile SPM involves gradual detailing, prioritized work order that are just-in-time, and independent teams.

### Exploration
* Define high-level requirements
* Prioritize from business perspective
* Explore / prototype

### Planning 
* Prioritize user stories
* Backlog (scrum)
* Story cards, story board, Kanban board
* Re-estimate, for each sprint
* Select set of stories for iteration according to capacity

#### Kanban board 
Simplest version - columns for to-do, in progress, done

Common version - Backlog, Ready, Coding, Testing, Approval, Done columns

Used to, visualize workflow, limit work-in-progress, pull work from column to column, monitor, adapt, improve etc.

### Time boxing 
* Time-box fixed deadline by which something has to be delivered
* Typically two to six week iterations
* Develop the most prioritized stories first

### Development 
* Iterations a.k.a. sprints
  * Scrum: 30 days prescribed, but varies in reality
  * XP: shorter, 2 weeks
* Work in prio order
  * Scrum: team chooses stories in sprint planning
  * XP: team chooses stories strictly according to agreed prio
* Managing change
  * Scrum: no changes in scope / stories during sprint
  * XP: changes allowed

### Activity planning
* Product Owner/Customer defines and prioritises User stories
* Backlog or Story card management
* Dependencies are built into the prioritised list, i.e. not explicitly marked

### Effort estimation
* Early estimates during exploration phase
* User stories estimated as part of iteration/sprint planning
* Time (man/person hours/days) or relative estimates (story points, bananas, gummy bears)
* Planning game (XP) or Planning poker (Scrum)

### Resource allocation
* Capacity driven
  * Project level: In exploration phase
  * Iteration level: In iteration planning
* Within iteration: team pull, i.e. self-allocation

### Risk management
* Built into the process, e.g. stand-up meetings: Hindrances?
* Transparency, openess with information
* Iteration demos with customer / product owner

Traditional risk management techniques can be used, but not prescribed by Agile methods as such.

### Monitor and control
* Progress monitored by asking ”How much work remains?”
* Frequent status checks -> Burn-down charts, see below

```
\ Is desired velocity
+ Is actual velocity

|\+++++++
|  \    +++
|    \    ++
|      \   +
|        \  +
|          \+
|           +\
|            + \
|             +++\
  0  1  2  3  4  5  6
```

