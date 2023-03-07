# Laboratory work


## Laboratory work №1

### Goal
Recall the basics of interaction with the distributed version control system Git, as well as with the GitHub server. Repeat the principles of writing documents in the Markdown markup language.

### Task
Create a repository on GitHub based on a template repository by copying via SSH, or directly on the site. Add the first commit. Create a report using the Markdown markup language. Convert the report to files with the extension .docx and .pdf using Makefile. Create a presentation using the Markdown markup language. Convert the presentation to files with the extension .html and .pdf with Makefile usage.


## Laboratory work №2

### Goal
Familiarize yourself with the basic functionality of the Julia programming language, as well as the interactive command line REPL. Familiarize yourself with the basic functionality of the Modelica modeling language and the OpenModelica software. Using these tools, to build a mathematical model, which is a special case of the chase problem.

### Task
1. Write down an equation describing the movement of the boat, with initial conditions for two cases (depending on the location of the boat relative to the boat at the initial time).
1. Plot the trajectory of the boat and the boat for two cases.
1. Find the intersection point of the trajectory of the boat and the boat


## Laboratory work №3

### Goal
To get acquainted with the basic functionality of the Pluto interactive notebook. Consider the simplest model of combat operations — the Lanchester model. To build this mathematical model using Julia programming language, Pluto interactive notepad, Modelica modeling language and OpenModelica software.

### Task
1. Write down a model of warfare between regular troops using the ODE system.
1. Write down a model of conducting combat operations with the participation of regular troops and partisan detachments using the ODE system.
1. Set the initial conditions of the task.
1. Build graphs of changes in the number of troops of armies.


## Laboratory work №4

### Goal
Continue acquaintance with the functionality of the Julia programming language, additional libraries (DifferentialEquations, Plots), the interactive Pluto notepad, as well as the interactive command line REPL. Continue familiarization with the Modelica modeling language and OpenModelica software. Using these tools, describe a mathematical model of harmonic oscillations.

### Task
Construct a phase portrait of the harmonic oscillator and the solution of the harmonic oscillator equation for the following cases:

1. Oscillations of the harmonic oscillator without damping and without the action of an external force $\ddot x + 2.5x = 0$.
1. Oscillations of a harmonic oscillator with attenuation and without the action of an external force $\ddot x + 10\dot x + 11x = 0$.
1. Oscillations of a harmonic oscillator with attenuation and under the influence of an external force $\ddot x + \dot x + x = 3 \sin(t) $.

On the interval $t\in [0; \65]$ (step $0.05$) with initial conditions $x_0=-1, \y_0=2$.


## Laboratory work №5

### Goal
Continue to get acquainted with the functionality of the Julia programming language, additional libraries (DifferentialEquations, Plots), the interactive Pluto notepad, as well as the interactive command line REPL. Continue familiarization with the Modelica modeling language and OpenModelica software. Using these tools, describe the Lotka-Volterra mathematical model.

### Task
For the predator-prey model:

$$
\left\{
\begin{array}{c}
\frac{dx}{dt} = -0.16x(t) + 0.045x(t)y(t)\\
\\
\frac{dy}{dt} = 0.36y(t) - 0.033x(t)y(t)
\end{array}
\right.
$$

Plot the dependence of the number of predators on the number of victims, as well as graphs of changes in the number of predators and the number of victims under the following initial conditions: $x_0 = 10$, $y_0 = 15$. Find the stationary state of the system.