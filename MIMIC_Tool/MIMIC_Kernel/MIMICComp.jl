##############################################################
#   This code is part of the Phd Thesis "Interactions between pest attacks and plant growth
# using a model approach applied to robusta coffee in Uganda. Effects on production"
# and the DeSira project in Uganda.
#
# Main Author: Houssem E.M TRIKI CIRAD-PHIM/AMAP
# Co authors: Marc Jaeger, Fabienne Rebeyre
# Created: June 2022
##############################################################
# In this file, all the components are initialised + every âckage can be added here for an execution
# @timeit to "pseudo models construction" 
using TimerOutputs
# using Plots
# gr(size = (750, 565))
# theme(:default)
Directory_UC = Directory_Main * "/MIMIC_UC.yml"
Directory_Kernel = @__DIR__ 
Directory_DataSelection = Directory_Kernel * "/MIMIC_data_selection.jl"
Directory_Scheduling = Directory_Kernel * "/MIMIC_Scheduling.jl"
include(Directory_Kernel * "/MIMIC_Mediator.jl");
include(Directory_Kernel * "/MIMIC_Scheduling.jl");
include(Directory_Kernel * "/MIMIC_Results.jl");
(platformFruitsCohorts, validationFruits) = FruitInitialisation(Model_Coffee_tree.Arguments);

println("  ")
println("Initialisation completed")
printstyled("============================"; color = :cyan)
println("  ")


