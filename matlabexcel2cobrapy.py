import pandas as pd
import cobra
from cobra import Model, Reaction, Metabolite

print('check that the reactions and metabolite names are under the correct headers in the spreadsheet and that the file location is correct later in this code. They are case sensitive')

def sort_metabolites(equation):
    metabolite_list = {}
    #split into parts (left/right)
    equation_left, equation_right = equation.split('<=>')
    #check for coefficients
    for metabolite in equation_left.split("+"):
        metabolite = metabolite.strip()
        if metabolite.find(' ') > 0: #if it has a space in the name (means there's a coefficient)
            m = metabolite.split(" ")
            coefficient = float(m[0]) * -1.0
            metabolite_name = m[1]
        else:
            coefficient = -1.0
            metabolite_name = metabolite
        metabolite_list[metabolite_name] = coefficient
    if len(equation_right.strip()) > 0:
        for metabolite in equation_right.split("+"):
            metabolite = metabolite.strip()
            if metabolite.find(' ') > 0: #if it has a space in the name (means there's a coefficient)
                m = metabolite.split(" ")
                coefficient = float(m[0])
                coefficient = coefficient * 1.0
                metabolite_name = m[1]
            else:
                coefficient = 1.0
                metabolite_name = metabolite
            metabolite_list[metabolite_name] = coefficient
    return metabolite_list

# Read the Excel file
file_path = 'C:/Users/'     #put your model file location in here
reaction_sheet_name = 'Reaction List'
metabolite_sheet_name = 'Metabolite List'

reaction_df = pd.read_excel(file_path, sheet_name=reaction_sheet_name)
metabolite_df = pd.read_excel(file_path, sheet_name=metabolite_sheet_name)

# Create an empty COBRApy model
model = Model('model1')

# Create a dictionary to store metabolite objects
metabolites_dict = {}

# Add metabolites to the model
for index, row in metabolite_df.iterrows():
    metabolite_id = row['Metabolite ID']
    metabolite = Metabolite(metabolite_id, 
                        formula=row['Charged formula'],
                        name=row['Description'],
                        compartment=row['Compartment'])
                        #notes=row['InChi string'])
    metabolite.name = row['Description']
    metabolite.charge = row['Charge']
    metabolite.compartment = row['Compartment']
    metabolite.annotation['inchikey'] = row['InChi string']
    
    # Add metabolite to the model
    model.add_metabolites(metabolite)


    # Store metabolite object in the dictionary
    metabolites_dict[metabolite_id] = metabolite

#for x in model.metabolites:
    #print('%9s : %s and %s' % (x.id, x.formula, x.charge))

for index, row in reaction_df.iterrows():
    reaction = Reaction(row['Reaction ID'])
    reaction.name = row['Description']
    reaction.subsystem = row['Subsystem']
    reaction.lower_bound = row['Lower bound']
    reaction.upper_bound = row['Upper bound']
    #reaction.gene_reaction_rule = row['GPR']
    #print(reaction)
    #print(reaction.reaction)
    model.add_reactions([reaction])
    
    
    reaction.add_metabolites(sort_metabolites(row["Reaction"]))
    if row['Objective'] == 1:
        model.objective = row['Reaction ID']
    #print(reaction)
    
print(model.metabolites)
print('this is the objective')
print(model.objective.expression)
print(model.objective.direction)
solution = model.optimize()
print(solution.objective_value)
print(solution)

from pathlib import Path
from cobra.io import load_json_model, save_json_model, load_matlab_model, save_matlab_model, read_sbml_model, write_sbml_model
import logging

import cobra
from cobra.io import write_sbml_model

# Create a copy of the model
model_copy = model.copy()

# Modify the metabolite names in the copy
for metabolite in model_copy.metabolites:
    metabolite.name = str(metabolite.name)  # Convert name to a string to avoid type mismatch

# Save the modified copy as an SBML file
write_sbml_model(model_copy, "test_kuenenia.xml")
#write_sbml_model(model, "test_kuenenia.xml")
