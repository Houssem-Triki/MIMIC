# MIMIC
Mediation Interface for Model Inner Coupling

## What is it?
MIMIC is a coupling tool that let you connect models through their inputs and outputs.
The fundamental assumption of the coupling is that each model operates and evaluates its own internal states in a finite amount of time, from one internal step to the next. MIMIC supervises the interaction through its own states and information, which are evaluated based on the information collected from the connected models.


## Software and Dependencies of MIMIC
In order to use this tool, you need to download Julia REPL v 1.8.5 at least. [Julia download link](https://julialang.org/downloads/).

Installing packages in Julia REPL can be done by typing `using Pkg` beforehand. This allows you to use the following command lines to install MIMIC's dependencies:
- YAML (write `Pkg.add("YAML")` in Julia's REPL)
- OrderedCollections (`Pkg.add("OrderedCollections")`)
- TimerOutputs (`Pkg.add("TimerOutputs")`)

## Dependencies of MIMIC interaction example
The following packages are needed to run the example of the interaction:
- CSV (`Pkg.add("CSV")`)
- DataFrames (`Pkg.add("DataFrames")`)
- Interpolations (`Pkg.add("Interpolations")`)

## Installation of MIMIC.jl
You can download the directory "MIMIC_tool" directly in your working folder.

## How to use
Interactions in MIMIC are generated from the users’ instructions, covering the following two aspects: 1) the interaction code itself written by the user and so called UIM (User interaction Model) 2) the control of the simulation so called UC (User simulation control). 
This mean that you only need to edit the two files "MIMIC_UIM.jl" and "MIMIC_UC.yml" for coupling your models. (you can use a simple text editor or download a code editor like VScode, with the Julia addon [following this tutorial](https://code.visualstudio.com/docs/languages/julia) )

## Proceding with the simulation

In Julia's REPL, you need to change the directory with the command `cd("C:/My/New/Working/Directory/MIMIC_Tool")` to the directory of MIMIC.jl. Afterwords, you need to use the following command `include("MIMIC.jl")`. This will allow the initialisation of MIMIC in order to use the functions that it offers.

Then, you can lanche the initialisation of your interaction with the following command `MIMICinit()`. You can check for the scheduled tasks to be executed by putting the following command: `Scheduled_tasks_List`.

If you wish to simulate the coupling that you established, the command line you need to use is `MIMICmain(Scheduled_tasks_List)`.
At the end of the simulation, you get the results in a CSV file, located in the main derectory under the name  "Results_yyyy_mm_dd__HH_MM_SS.CSV".


