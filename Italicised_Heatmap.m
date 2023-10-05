cdata = [45 60 32; 43 54 76; 32 94 68; 23 95 58];
%heatmapdata = [Species Ca.Keunenia_Stuttgartiensis Brocadia_Sinica Brocadia_Sapporiensis Brocadia_Pituitae Brocadia_Caroliensis Brocadia_Fulgida Jettenia_ecosi Jettenia_Caeni Ca.Scalindua_Japonica Scalindua_Rubra Scalindua_Sediminis Scalindua_Brodae; Nitrite_reductase 1 0 0 0 1 1 1 1 1 1 1 1; Hydroxylamine_Reductase 0 0 0 0 0 0 0 0 2 1 0 1;]
enzymelabels = {'Nitrite Reductase'	'Hydroxylamine Reductase'	'Hydroxylamine Oxidoreductase'	'Hydrazine Synthase Subunit Alpha'	'Hydrazine Synthase Subunit Beta'	'Hydrazine Synthase Subunit C'	'Hydrazine dehydrogenase'};
AnammoxSpecies = {'\it Ca. Brocadia Caroliensis',
'\it Ca. Brocadia fulgida',
'\it Ca. Brocadia pituitae',
'\it Ca. Brocadia sapporiensis',
'\it Ca. Brocadia sinica',
'\it Ca. Jettenia caeni',
'\it Ca. Jettenia ecosi',
'\it Ca. Kuenenia stuttgartiensis',
'\it Ca. Scalindua brodae',
'\it Ca. Scalindua japonica',
'\it Ca. Scalindua rubra',
'\it Ca. Scalindua sediminis'};

genevalues = [1	0	2	1	1	1	5
1	0	2	1	1	1	3
0	0	2	2	2	3	4
0	0	2	1	1	1	2
0	0	3	2	2	3	3
1	0	6	2	2	3	4
1	0	3	1	1	2	1
1	0	3	2	3	3	4
1	1	1	1	1	1	5
1	2	3	1	1	1	5
1	1	2	1	1	1	5
1	0	1	1	2	2	4];
%he = heatmap(genevalues);

%disp(heatdata);
map = [0 0.14 0
    0 0.285 0
    0 0.428 0
    0 0.57 0
    0 0.857 0
    0 1 0];
h = heatmap(enzymelabels,AnammoxSpecies,genevalues,'Colormap',map,'CellLabelColor','none');
%h.YDisplayLabels = repmat({''}, size(h.YData));  %remove row labels
a2 = axes('Position', h.Position);               %new axis on top
a2.Color = 'none';                               %new axis transparent
a2.YTick = 1:size(h.ColorData,1);                %set y ticks to number of rows
a2.XTick = [];                                   %Remove xtick
% alternatively, to preserve axis label spacing :
% a2.XTickLabel = repmat({' '}, size(a2.XTick)); 
ylim(a2, [0.5, size(h.ColorData,1)+.5])          %center the tick marks
a2.YDir = 'Reverse';                             %flip your y axis to correspond with heatmap's
%a2.YTickLabel = AnammoxSpecies;                  %set you ytick labels here, formatted.
%ylabel('{\it T}_g ,[°C]')
%h.Title = 'Anammox Nitrogen Metabolism Gene Distribution';
disp(h);
text = 'you have to drag the second set of axes down out of the figure';
disp(text)
%heatmap('enzymelabels','AnammoxSpecies',society);