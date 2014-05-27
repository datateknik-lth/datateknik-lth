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
* Frequent status checks -> Burn-down charts, see monitor and control chapter.

* Management does NOT control in agile, the ”pigs” (Product owner, scrum master, team leader) do!
* Team is responsible for managing itself – Team pull!

**Team responsible for its own work practice / process**
* Regular feedback loops: pair programming, daily stand-up
* Sprint retrospectives

### Scaling agile
* Designed for small scale – 1 team
* Scalable with Scrum-of–Scrums, shared backlog
* Upscaling specific to each organisation

```          ____
            | AX |            <-- Scrum of Scrums of Scrums
              / \____..
           __/_
          |ABCD|              <-- Scrum of Scrums
    _________|_________
 __/_   __/_   _\__   _\__
|AAAA| |BBBB| |CCCC| |DDDD|   <-- Scrum teams
```

### Strengths
* Feedback from early stages used in developing latter stages.
* Shorter development thresholds
* Quickly delivers working increments
* User gets some benefits earlier
* Reduces ‘gold-plating’
* Avoids unnecessary overhead, e.g. keeping docs updated
* Shorten comm paths within cross-functional teams

### Weaknesses
* Refactoring causes software breakages-
* Loss of economy of scale.
* Weak / missing documentation – especially for large scale.
  * Dependence on personal knowledge.
  * Decision rationale, reqst-tc tracing may be lost.
* Generalists have weaker specialist competence, e.g. requirements, testing, architecture.
* Weak long-term and overall perspective.
