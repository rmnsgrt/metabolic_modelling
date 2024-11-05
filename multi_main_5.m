%multi_main_2
%This program runs main.m from DFBAlab iteratively with different
%conditions defined in the "conditions" section


crumbs = -1.*[5:0.5:10];
pHst = 10.^(crumbs);
Tst = 0:1:60;

r = 1:1:61;
p = 1:1:11;
%total_biomass = zeros(60,10);
%finalY2 = zeros(60,10);
%finalY3 = zeros(60,10);
%finalY4 = zeros(60,10);
%finalY5 = zeros(60,10);
%finalY6 = zeros(60,10);

for r = 31:1:32
    for p = 4:1:11
    T_Start = Tst(r);
    pH_Start = pHst(p);
    main
    total_biomass(r,p) = sum(Y(end,2:6));
    finalY2(r,p) = Y(end,2);
    finalY3(r,p) = Y(end,3);
    finalY4(r,p) = Y(end,4);
    finalY5(r,p) = Y(end,5);
    finalY6(r,p) = Y(end,6);

    end
end