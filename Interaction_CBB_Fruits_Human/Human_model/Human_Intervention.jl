##############################################################
#   This code is part of the Phd Thesis "Interactions between pest attacks and plant growth
# using a model approach applied to robusta coffee in Uganda. Effects on production"
# and the DeSira project in Uganda.
#
# Main Author: Houssem E.M TRIKI CIRAD-PHIM/AMAP
# Co authors: Marc Jaeger, Fabienne Rebeyre
# Created: June 2022
##############################################################
### Human harvest model
HarvestHealthy = []
HarvestColonized = []
GreenHealthy = []
GreenColonized = []

function Human_Intervention_Harvest(fruitsCohorts, hday, validationFruits)
    #-------------------------------------------------------------------------------------------------------------------------------------------------------
    #--- Harvest
    TotHarvestHealthy = 0 ;
    TotHarvestColonized = 0 ;
    TotHarvestHealthyG = 0 ;
    TotHarvestColonizedG = 0 ;
    if  any(x->x == hday, validationFruits[:,1])
        for i in eachindex(fruitsCohorts)
            if fruitsCohorts[i].ChronologicalAge >= 196 && fruitsCohorts[i].State == false && fruitsCohorts[i].NumberOfOrgans > 0
                TotHarvestHealthy += fruitsCohorts[i].NumberOfOrgans 
                fruitsCohorts[i].NumberOfOrgans = 0
            elseif fruitsCohorts[i].ChronologicalAge >= 196 && fruitsCohorts[i].State == true && fruitsCohorts[i].NumberOfOrgans > 0
                TotHarvestColonized += fruitsCohorts[i].NumberOfOrgans 
                fruitsCohorts[i].NumberOfOrgans = 0
                global Colony -= fruitsCohorts[i].NumberOfOrgans
            elseif fruitsCohorts[i].ChronologicalAge >= 105  && fruitsCohorts[i].ChronologicalAge < 196 && fruitsCohorts[i].State == false && fruitsCohorts[i].NumberOfOrgans > 0
                TotHarvestHealthyG += fruitsCohorts[i].NumberOfOrgans 
            elseif fruitsCohorts[i].ChronologicalAge >= 105  && fruitsCohorts[i].ChronologicalAge < 196 && fruitsCohorts[i].State == true && fruitsCohorts[i].NumberOfOrgans > 0
                TotHarvestColonizedG += fruitsCohorts[i].NumberOfOrgans 
            end
        end
        push!(HarvestHealthy,[TotHarvestHealthy hday])
        push!(HarvestColonized,[TotHarvestColonized hday])
        push!(GreenHealthy,[TotHarvestHealthyG hday])
        push!(GreenColonized,[TotHarvestColonizedG hday])
        # end
    end
    return fruitsCohorts, HarvestHealthy; HarvestColonized; GreenHealthy; GreenColonized
end