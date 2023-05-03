# MIMIC_UC
The UC defines the information about the simulation's operation and the model definition that are going to interact. This information is in the form of a YAML file. The UC is used to parse the model metadata and create the variables that will be used during the interaction execution process. The model priority is set by the model rank, which is the order in which the model is described in the MIMIC_UC.yml file.

A model is defined by filling the following fields:
|  Field name | Sub-Field name | User input |
| :---: | :---: | :---: |
| ***Is_model_active***   ||  true/false | 
| ***Name***        ||  Given name of the model | 
| ***Time Data***   | **Nature** | *** | 
|     | **Unit_step_size** | *** | 
|     | **End_Simulation** | *** | 
|     | **Start_Simulation** | *** | 
| ***Variables Data***   | **State_variables** | *** | 
|    | **Inputs** | *** | 
|    | **Outputs** | *** | 
| ***Function***   | **Call** | *** | 
|    | **Arguments** | *** | 
|    | **File** | true/false | 



In the present example, two coffee tree data are available. You can switch between the two at the coffee tree model definition. as follow : 
``` YAML
Model2:
  Is_model_active: true
  Name: Coffee_tree
  Version: 0.9
  language: Julia
  PathToFile: /Interaction_CBB_Fruits_Human/Fruit_model/Plant_Fruit_Dev.jl
  Perfs: false
  Nature_of_Step: 
    Nature: Day
    Unit_step_size: 1
    End_Simulation: 354
    Step_offset: 1
  Variables:
    State_variables: [fruitsCohorts]
    Inputs: /Interaction_CBB_Fruits_Human/Fruit_model/Plant_fruits/Sumatra_Fruits_C22.csv
    Myrefdir: D:/Mes Donnees/Julia/cbb_model/Plant_fruits
    Outputs: [fruitsCohorts, sumatraFruits]
  Function: 
    Call: FruitInitialisation
    Arguments: /Interaction_CBB_Fruits_Human/Fruit_model/Plant_fruits/Sumatra_Fruits_C22.csv
    File: true
 ```



# MIMIC_UIM
Users write code in the Julia language that describes how the models interact with each other by using the state variables. But you don't have to use Julia to encode the UIM: i) the interaction code can also be an "external" model, which is part of the Model layer but has a higher level of complexity and worse performance because it needs to be wrapped in a pseudo-model. ii) If the interaction works with a low coupling level only on the existing models' direct inputs and outputs, this is called a "shared coupling." The user doesn't have to give any UIM. The simulation starts right from the initial schedule and runs based on the input and output definitions for implicit cycles that were given for the pseudo-model generation. 






However, there are some conditions on writting the UIM:
- The interaction code needs to be written in a form of a function 
- The array variable "ModelsNames" must contain the name of the models that are meant to be translated (same name as in MIMIC_UC)
- for each modela translation, a test is conducted on its name 

Template of MIMIC_UIM:
``` Julia
ModelsNames = ["Model1_name", "Model3_name"] 
function MIMIC_system_stats(Model1_stateVariables..., Model3_stateVariables..., executedModel)
# executedModel variable is meant to be kept as an input
  if executedModel == ModelsNames[1]
  ... # translation code from model1 to others
  end
  if executedModel == ModelsNames[2]
  ... # translation code from model3 to others
  end
  
  global Model1_stateVariables
  global Model3_stateVariables
  return Model1_stateVariables, Model3_stateVariables
end
```


# Using code written in another coding language
In order to use a code written in other than Julia, you need to install in Julia the adequate package to run it. Julia support C, R, Matlab and python languages.
- For R, the package name is   `RCall` 
- For Python, `PyCall`
- For Matlab, you can use `Matlab.jl`or `Mex.jl`
- For C, the basic code of Julia integrate it with the `ccall`function. 
