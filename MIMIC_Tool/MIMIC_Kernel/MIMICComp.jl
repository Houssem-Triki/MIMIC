##############################################################
#   This code is part of the Phd Thesis "Interactions between pest attacks and plant growth
# using a model approach applied to robusta coffee in Uganda. Effects on production"
# and the DeSira project in Uganda.
#
# Main Author: Houssem E.M TRIKI CIRAD-PHIM/AMAP
# Co authors: Marc Jaeger, Fabienne Rebeyre
# Created: June 2022
##############################################################
# In this file, all the components are initialised + every pâckage can be added here for an execution
using Dates
using TimerOutputs
# using Plots
# gr(size = (750, 565))
# theme(:default)
Directory_UC = Directory_Main * "/MIMIC_UC.yml";
Directory_Kernel = @__DIR__ ;
include(Directory_Kernel * "/MIMIC_data_selection.jl");
include(Directory_Kernel * "/MIMIC_Mediator.jl");
include(Directory_Kernel * "/MIMIC_Scheduling.jl");
include(Directory_Kernel * "/MIMIC_ISDR.jl");

# (platformFruitsCohorts, validationFruits) = FruitInitialisation(Model_Coffee_tree.Arguments);

println("  ")
println("Initialisation completed")
printstyled("============================"; color = :cyan)
println("  ")


# mapreduce(permutedims, hcat, CompMIMIC_ISDR.ArgValue[1])
# reduce(vcat, CompMIMIC_ISDR.ArgValue[1])
# v = Vector{Any}(nothing, length(CompMIMIC_ISDR.ArgValue[1]))

# for i in eachindex(CompMIMIC_ISDR.ArgValue)
#     v = hcat(v, CompMIMIC_ISDR.ArgValue[i])
# end
# v = v[:,2:end]
# v = reduce(vcat,v)
# d = DataFrame(v, :auto)


