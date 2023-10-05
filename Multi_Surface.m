%https://opencobra.github.io/cobratoolbox/latest/tutorials/tutorialRobustnessPhPP.html

%% Instructions

%i represents the y axis
%j represents the x axis
%FBAsolution is the z axis
%%
% use model = readCbModel('Kuenenia_Scratch_V3.xls')

[X,Y] = meshgrid(0:1:20);
model.lb(55) = 0;
model.ub(55) = 0;
model.lb(59) = -1000;
model.ub(59) = 1000;

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

model.lb(22) = 0;
model.lb(59) = 0;
model.ub(59) = 0;
model.lb(55) = -1000;
model.ub(55) = 1000;
modelph = zeros(21);
ATPphppRates2 = zeros(21);
for y = 0:20
for x = 0:20
model.lb(9) = -y;
model.lb(23) = -x;
FBAsolution = optimizeCbModel(model);
ATPphppRates2(y+1,x+1) = FBAsolution.f;
end
end


figure;
colormap cool
surfl(ATPphppRates) % 3d plot
ylabel('electron flux to sink Limit')
xlabel('EX-Ammonium[e] Limit')
zlabel('ATP[c] demand')
hold on
surfl(ATPphppRates2, 'light')
hold off
