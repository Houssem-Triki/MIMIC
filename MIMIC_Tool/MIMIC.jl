##############################################################platformFruitsCohorts
#   This code is part of the Phd Thesis "Interactions between pest attacks and plant growth
# using a model approach applied to robusta coffee in Uganda. Effects on production"
# and the DeSira project in Uganda.
#
# Main Author: Houssem E.M TRIKI CIRAD-PHIM/AMAP
# Co authors: Marc Jaeger, Fabienne Rebeyre
# Created: June 2022
##############################################################
### MIMIC.jl is the main code for the interaction platform
#----------------------------------------------------------------------------------------------------------

Directory_Main = @__DIR__

function MIMICinit()
    include(Directory_Main * "/MIMIC_Kernel/MIMICComp.jl");
end


function MIMICmain(Scheduled_tasks_List)
    while Simulation_Time != End_time
        @eval $(Symbol("$NatureOfTime")) = Simulation_Time  
        global Scheduled_tasks_List
        Scheduled_tasks_List = CompMIMIC_CS.MyScheduling(Simulation_Time, Scheduled_tasks_List)
        if CompMIMIC_ISS.FunctionName !== nothing
        CompMIMIC_ISS.call()
        end
        #------
        global Simulation_Time += Step_time
    end
    CompMIMIC_ISDR.call()
    println("  ")
    println("MIMIC tasks' completed ")
    printstyled("============================"; color = :yellow)
    println("  ")
end


println("   ")
println("End of simulation ")
printstyled("============================"; color = :red)
println("  ")



