##############################################################
#   This code is part of the Phd Thesis "Interactions between pest attacks and plant growth
# using a model approach applied to robusta coffee in Uganda. Effects on production"
# and the DeSira project in Uganda.
#
# Main Author: Houssem E.M TRIKI CIRAD-PHIM/AMAP
# Co authors: Marc Jaeger, Fabienne Rebeyre
# Created: June 2022
##############################################################
### Compiling the needed data for execution
#------------------------------------------------------------------------------------------------------------------------------------------------------

#----------- for stand alone execution 
# include("Climate_module.jl")
# include("Plant_Fruit_Dev.jl")
# using .PlantFruit
# include("MIMIC_SystemStats.jl")    

#-----------
include(Directory_CBB * "/CBB_dynamics.jl");
include(Directory_CBB * "/CBB_Func_Laws.jl");
include(Directory_CBB * "/CBB_init.jl");
include(Directory_CBB * "/CBB_attack.jl")
include(Directory_CBB * "/CBB_attack_rest.jl");

# include("Climate_module.jl")
# using .Climate_data
#-----------
# FruitInitialisation()
# for i in eachindex(fruitsCohorts)
#     if fruitsCohorts[i].State == true
#         global FirstCBB += fruitsCohorts[i].NumberOfOrgans
#         push!(scolyteGroup, ScolyteGroup(0, FirstCBB, 0, vie_sco(environment.temperature[1]), 0, 0, 0, 0));
#         global Colony  = scolyteGroup[1].population; 
#     end
# end




