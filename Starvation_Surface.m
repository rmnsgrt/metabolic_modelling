%https://opencobra.github.io/cobratoolbox/latest/tutorials/tutorialRobustnessPhPP.html

%% Instructions

%i represents the y axis
%j represents the x axis
%FBAsolution is the z axis

%%

modelphpp = zeros(21);
ATPphppRates = zeros(21);
for i = 0:20
for j = 0:20
model.lb(22) = -i;
model.lb(23) = -j;
FBAsolution = optimizeCbModel(model);
ATPphppRates(i+1,j+1) = FBAsolution.f;
end
end

figure
colormap cool
surfl(ATPphppRates) % 3d plot

%ylabel('constraint 1', 'FontSize', 20)
%xlabel('constraint 2', 'FontSize', 20)
%zlabel('Growth Flux', 'FontSize', 18)

ylabel('EX-NO2[e] Limit')
xlabel('EX-Ammonium[e] Limit')
zlabel('Biomass Flux')