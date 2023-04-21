##############################################################
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
#= Initialisation of MIMIC coupling
Data provided by the user (UC & UIM) are treated and used to initialise the coupling.
the initialisation results in an ordered list of the tasks to be executed
=#

function MIMICinit()
    include(Directory_Main * "/MIMIC_Kernel/MIMICComp.jl");
end

#= Main function of MIMIC coupling
    Scheduled_tasks_List: results from the initialisation (MIMICinit), it holds the liste and order of executing the tasks
=#

function MIMICmain(Scheduled_tasks_List)
        while Simulation_Time != End_time + 1
            @eval $(Symbol("$NatureOfTime")) = Simulation_Time  
            global Scheduled_tasks_List
            Scheduled_tasks_List = CompMIMIC_CS.MyScheduling(Simulation_Time, Scheduled_tasks_List)
            CompMIMIC_ISS.call()
            #------
            global Simulation_Time += Step_time
        end
        # CompMIMIC_ISDR.call()
        println("  ")
        println("MIMIC tasks' completed ")
        printstyled("============================"; color = :yellow)
        println("  ")
end


MIMICinit()

MIMICmain(Scheduled_tasks_List)

CompMIMIC_ISDR.call()
# paths = "D:/Thèse/Results"
# function MIMICresult(PathToResults)
#     CompMIMIC_ISDR.PersonalCall(PathToResults)
# end

# MIMICresult(paths)
println("   ")
println("End of tool initialisation, you can now use the commands of MIMIC ")
printstyled("============================"; color = :red)
println("  ")
    
# length(CompMIMIC_ISDR.Arguments)







# name = []
# push!(name, "dada1")
# push!(name, "dada2")

# val = rand(Int, 2,3)
# FOutputs = []

# Space1 = Vector{Any}(undef, length(name))

# for i in eachindex(name)
#     hcat(FOutputs, name[i])

#     hcat(FOutputs, Space1)


# end

