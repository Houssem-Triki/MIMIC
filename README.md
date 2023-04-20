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

installing all the packages with : `Pkg.add("CSV", "DataFrames", "Interpolations")`
## Installing MIMIC.jl
[Download](https://github.com/Houssem-Triki/MIMIC/archive/refs/heads/main.zip) the Project and unzip it in your working folder.

In Julia's REPL, change the working directory with the command `cd("D:/MyWorkingFolder/MIMIC_Tool")` to your working folder. 

(*Warning*: the command cd needs to be writen in the same synthax as the example, without special characters or spaces).

Run then the command `include("MIMIC.jl")` in order to load MIMIC's code in Julia.

## Running the exemple
launch the initialisation of your interaction with the command `MIMICinit()`. 
launch the simulation by typing `MIMICmain(Scheduled_tasks_List)`.

At the end of the simulation, you get the results in a CSV file, located in the main derectory under the name  "Results_yyyy_mm_dd__HH_MM_SS.CSV".


## Creating your own interaction 
Interactions in MIMIC are generated from the users’ instructions, covering the following two aspects: 1) the interaction code itself written by the user and so called UIM (User interaction Model) 2) the control of the simulation so called UC (User simulation control). 
This mean that you only need to edit the two files "MIMIC_UIM.jl" and "MIMIC_UC.yml" for coupling your models. (you can use a simple text editor or download a code editor like VScode, with the Julia addon [following this tutorial](https://code.visualstudio.com/docs/languages/julia) ).

Once you defined your models and the nteraction in MIMIC_UC and MIMIC_UIM, initialise your interaction with `MIMICinit()`.
You can check for the scheduled tasks to be executed by putting the following command: `Scheduled_tasks_List` before launching the simulation with `MIMICmain(Scheduled_tasks_List)`



