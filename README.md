# MIMIC
Mediation Interface for Model Inner Coupling

## What is it?
MIMIC is a coupling tool that let you connect models through their inputs and outputs.
The fundamental assumption of the coupling is that each model operates and evaluates its own internal states in a finite amount of time, from one internal step to the next. MIMIC supervises the interaction through its own states and information, which are evaluated based on the information collected from the connected models.

## Installation of MIMIC.jl
You can download the directory "MIMIC_tool" directly in your working folder.

## How to use:
Interactions in MIMIC are generated from the users’ instructions, covering the following two aspects: 1) the interaction code itself written by the user and so called UIM (User interaction Model) 2) the control of the simulation so called UC (User simulation control). 
In both cases, the instructions are processed through the “User-MIMIC communication” component. Indeed, we want the Kernel being untouched and safe from external process to guarantee the platform integrity.
This mean that you only need to edit the two files "MIMIC_UIM.jl" and "MIMIC_UC.jl"
