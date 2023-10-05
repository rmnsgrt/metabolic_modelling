%Redox_Heatmap
enzymelabels = {'Nitrite'	'Nitric Oxide'	'Electrode'	'Nitrate'	'hydroxylamine'	'Hydrazine'	'Sulphate'	'Fe(III)'};
AnammoxSpecies = {'Ammonium';
'Glucose';
'Glutamate';
'Propionate';
'Acetate'};

genevalues = [0	0	0	1	1	2	2   1
0	2	4	0	4	4	3   2
1	2	4	2	4	4	3   2
1	2	4	2	4	4	3   2
1	2	4	2	4	4	3   2];
%he = heatmap(genevalues);

%disp(heatdata);
map = [0 0.14 0
    0 0.285 0
    0 0.428 0
    0 0.57 0
    0 0.857 0
    0 1 0];
map = [0 0.9 0.1
    0.95 0.95 0
    0.8890 0.6940 0.05
    0.9790 0.5040 0.10
    1 0 0];
blindmap = [0 0 1
    0.2322 0.1735 0.8
    0.4644 0.3470 0.6
    0.6967 0.5205 0.4
    0.9290 0.6940 0.1250];
    
%map = cool;
h = heatmap(enzymelabels,AnammoxSpecies,genevalues,'Colormap',blindmap,'CellLabelColor','none');
title('REDOX couples in the ANAMMOX pangenome')

disp('green is core')
disp('yellow is dispensable')
disp('orange is likely dispensable')
disp('dark orange is possible in theory but lacks evidence')
disp('red is not possible')
