%https://opencobra.github.io/cobratoolbox/latest/tutorials/tutorialRobustnessPhPP.html

%% Instructions

%i represents the y axis
%j represents the x axis
%FBAsolution is the z axis

%%

modelphpp = zeros(21);
ATPphppRates = zeros(5);

for y = 1:5
for x = 1:10
    model.ub(40+y) = 0;
    model.ub(40+(y-1)) = 0;
    model.ub(40+y) = 0;
    model.ub(40+(y+1)) = 1000;
    model.lb(22) = -x;
FBAsolution = optimizeCbModel(model);
ATPphppRates(x,y) = FBAsolution.f;
end
end
figure
colormap cool
surf(ATPphppRates) % 3d plot
%xlabels = {'ETC efficiency (number of protons', ' translocated per electron', ' in the electron transport chain)'}
%xlabel(xlabels);
%ylabels = {'Ammonium flux', '(mmolATP/gDCW)'}
%xlabel('number of protons translocated per electron in the electron transport chain')
%ylabel(ylabels, 'FontSize', 12)
%zlabel('ATP flux (mmolATP/gDCW)', 'FontSize', 15)