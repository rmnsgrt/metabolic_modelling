% mass conservation checker
%inputs from substrate
Nitrogen = 7.5335*ans.f + ans.v(21)+ans.v(22)+ans.v(23)+ans.v(32)+2*ans.v(26)+ans.v(28);
Carbon = ans.v(24)+(38*ans.f);

%Total mass balance
mass_in = (ans.v(1)*89+ans.v(2)*35+ans.v(3)*39+ans.v(4)*23+...
ans.v(5)*95+ans.v(6)*96+ans.v(7)*56+ans.v(8)*56+ans.v(9)*55+...
ans.v(10)*55+ans.v(11)*59+ans.v(12)*65+ans.v(13)*18+...
ans.v(14)*1+ans.v(15)*160+ans.v(16)*59+ans.v(17)*63+...
ans.v(18)*129+ans.v(19)*65+ans.v(20)*40+ans.v(21)*61+...
ans.v(22)*46+ans.v(23)*18+ans.v(24)*44+ans.v(26)*28+ans.v(27)*34+...
ans.v(28)*30+ans.v(32)*146+ans.v(33)*180);

mass_imbalance = 1000*ans.f + mass_in;

if mass_imbalance == 0;
    disp('mass balanced');
else
    disp('biomass created, mass consumed from media, mass imbalance (milligrams), :') 
    disp(1000*ans.f)
    disp(mass_in)
    disp(mass_imbalance)
    percent_imbalance = -100*(mass_in/(1000*ans.f))-100
    disp(percent_imbalance);
end

%Nitrogen statement
if Nitrogen == 0;
    disp('Nitrogen balanced');
else
    disp('nitrogen imbalance by:') 
    disp(Nitrogen);
end
%Carbon statement
if Carbon == 0
    disp('Carbon balanced');
else
    disp('Carbon imbalance by:')
    disp(Carbon);
    disp('check if calculation is using the right reaction fluxes')
end

%Mass contribution by media component
mass_contribution = [ans.v(1)*89;ans.v(2)*35;ans.v(3)*39;ans.v(4)*23;...
ans.v(5)*95;ans.v(6)*96;ans.v(7)*56;ans.v(8)*56;ans.v(9)*55;...
ans.v(10)*55;ans.v(11)*59;ans.v(12)*65;ans.v(13)*18;...
ans.v(14)*1;ans.v(15)*160;ans.v(16)*59;ans.v(17)*63;...
ans.v(18)*129;ans.v(19)*65;ans.v(20)*40;ans.v(21)*46;ans.v(22)*18;ans.v(23);ans.v(24)*44;0;ans.v(26)*28];
