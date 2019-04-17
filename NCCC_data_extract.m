clc
clear
filename = 'UT Austin Data 4-10-19 master';
sheet = 1;

N1 = 305; %start position
N2 = 365; %end position
X = N2-N1 +1;

Loc1_coldrichFR = ['BQ' num2str(N1)];
Loc2_coldrichFR = ['BQ' num2str(N2)];
Loc_coldrichFR = strcat(Loc1_coldrichFR, ':', Loc2_coldrichFR);
coldrichFR = xlsread(filename,sheet,Loc_coldrichFR); %cold rich %FROM ABSORBER

Loc1_hotleanFR = ['BC' num2str(N1)];
Loc2_hotleanFR = ['BC' num2str(N2)];
Loc_hotleanFR = strcat(Loc1_hotleanFR, ':', Loc2_hotleanFR);
hotleanFR = xlsread(filename,sheet,Loc_hotleanFR); %hot lean

Loc1_coldrichbypassFR = ['GM' num2str(N1)]; %lb/hr
Loc2_coldrichbypassFR = ['GM' num2str(N2)];
Loc_coldrichbypassFR = strcat(Loc1_coldrichbypassFR, ':', Loc2_coldrichbypassFR);
coldrichbypassFR = xlsread(filename,sheet,Loc_coldrichbypassFR); %cold rich bypass

Loc1_warmrichbypassFR = ['GZ' num2str(N1)]; %lb/h
Loc2_warmrichbypassFR = ['GZ' num2str(N2)];
Loc_warmrichbypassFR = strcat(Loc1_warmrichbypassFR, ':', Loc2_warmrichbypassFR);
warmrichbypassFR = xlsread(filename,sheet,Loc_warmrichbypassFR); %warm rich bypass

coldrichFR1 = coldrichFR-coldrichbypassFR; %to first cross exchanger

Loc1_sumptemperature = ['IS' num2str(N1)];
Loc2_sumptemperature = ['IS' num2str(N2)];
Loc_sumptemperature = strcat(Loc1_sumptemperature, ':', Loc2_sumptemperature);
sumptemperature = xlsread(filename,sheet,Loc_sumptemperature);

Loc1_stripperP = ['GU' num2str(N1)]; %% PSIG
Loc2_stripperP = ['GU' num2str(N2)];
Loc_stripperP = strcat(Loc1_stripperP, ':', Loc2_stripperP);
stripperP = xlsread(filename,sheet,Loc_stripperP);

Loc1_CO2_flowrate = ['FF' num2str(N1)]; % lb/hr
Loc2_CO2_flowrate = ['FF' num2str(N2)];
Loc_CO2_flowrate = strcat(Loc1_CO2_flowrate, ':', Loc2_CO2_flowrate);
CO2_flowrate = xlsread(filename,sheet,Loc_CO2_flowrate);

Loc1_steam_flowrate = ['HQ' num2str(N1)]; % lb/hr
Loc2_steam_flowrate = ['HQ' num2str(N2)];
Loc_steam_flowrate = strcat(Loc1_steam_flowrate, ':', Loc2_steam_flowrate);
steam_flowrate = xlsread(filename,sheet, Loc_steam_flowrate);

Loc1_removal = ['CV' num2str(N1)];
Loc2_removal = ['CV' num2str(N2)];
Loc_removal = strcat(Loc1_removal, ':', Loc2_removal);
removal = xlsread(filename,sheet, Loc_removal);

% solvent temperatures
Loc1_coldrichT = ['BN' num2str(N1)];
Loc2_coldrichT = ['BN' num2str(N2)];
Loc_coldrichT = strcat(Loc1_coldrichT, ':', Loc2_coldrichT);
coldrichT = xlsread(filename,sheet, Loc_coldrichT);

Loc1_coldleanT = ['FV' num2str(N1)];
Loc2_coldleanT = ['FV' num2str(N2)];
Loc_coldleanT = strcat(Loc1_coldleanT, ':', Loc2_coldleanT);
coldleanT = xlsread(filename,sheet, Loc_coldleanT);

Loc1_warmrichT = ['FU' num2str(N1)];
Loc2_warmrichT = ['FU' num2str(N2)];
Loc_warmrichT = strcat(Loc1_warmrichT, ':', Loc2_warmrichT);
warmrichT = xlsread(filename,sheet, Loc_warmrichT);

Loc1_warmleanT = ['EL' num2str(N1)];
Loc2_warmleanT = ['EL' num2str(N2)];
Loc_warmleanT = strcat(Loc1_warmleanT, ':', Loc2_warmleanT);
warmleanT = xlsread(filename,sheet, Loc_warmleanT);

Loc1_hotleanT = ['HI' num2str(N1)];
Loc2_hotleanT = ['HI' num2str(N2)];
Loc_hotleanT = strcat(Loc1_hotleanT, ':', Loc2_hotleanT);
hotleanT = xlsread(filename,sheet, Loc_hotleanT);

Loc1_hotrichT = ['HM' num2str(N1)];
Loc2_hotrichT = ['HM' num2str(N2)];
Loc_hotrichT = strcat(Loc1_hotrichT, ':', Loc2_hotrichT);
hotrichT = xlsread(filename,sheet, Loc_hotrichT);

Loc1_coldrichbypassT = ['GR' num2str(N1)];
Loc2_coldrichbypassT = ['GR' num2str(N2)];
Loc_coldrichbypassT = strcat(Loc1_coldrichbypassT, ':', Loc2_coldrichbypassT);
coldrichbypassT = xlsread(filename,sheet, Loc_coldrichbypassT);

Loc1_warmrichbypassT = ['HF' num2str(N1)];
Loc2_warmrichbypassT = ['HF' num2str(N2)];
Loc_warmrichbypassT = strcat(Loc1_warmrichbypassT, ':', Loc2_warmrichbypassT);
warmrichbypassT = xlsread(filename,sheet, Loc_warmrichbypassT);

%solvent pressures

Loc1_coldrichP_AFTERPUMP = ['BP' num2str(N1)];  % after rich pump
Loc2_coldrichP_AFTERPUMP = ['BP' num2str(N2)];
Loc_coldrichP_AFTERPUMP = strcat(Loc1_coldrichP_AFTERPUMP, ':', Loc2_coldrichP_AFTERPUMP);
coldrichP_AFTERPUMP = xlsread(filename,sheet, Loc_coldrichP_AFTERPUMP);

Loc1_warmrichP = ['GX' num2str(N1)]; %PSIG
Loc2_warmrichP = ['GX' num2str(N2)];
Loc_warmrichP = strcat(Loc1_warmrichP, ':', Loc2_warmrichP);
warmrichP = xlsread(filename,sheet, Loc_warmrichP);

Loc1_coldleanP = ['BY' num2str(N1)]; %PSIG
Loc2_coldleanP = ['BY' num2str(N2)];
Loc_coldleanP = strcat(Loc1_coldleanP, ':', Loc2_coldleanP);
coldleanP = xlsread(filename,sheet, Loc_coldleanP);

hotex_richsideDP_calculated = warmrichP - stripperP; %hot exchanger rich side pressure drop (calculated)

Loc1_richsideDP_hotex = ['HG' num2str(N1)]; %differential pressure sensor value, rich side, hot exchanger
Loc2_richsideDP_hotex = ['HG' num2str(N2)];
Loc_richsideDP_hotex = strcat(Loc1_richsideDP_hotex, ':', Loc2_richsideDP_hotex);
richsideDP_hotex = xlsread(filename,sheet, Loc_richsideDP_hotex);

Loc1_leansideDP_hotex = ['HH' num2str(N1)]; %differential pressure sensor value, lean side, hot exchanger
Loc2_leansideDP_hotex = ['HH' num2str(N2)];
Loc_leansideDP_hotex = strcat(Loc1_leansideDP_hotex, ':', Loc2_leansideDP_hotex);
leansideDP_hotex = xlsread(filename,sheet, Loc_leansideDP_hotex);

warm_lean_pressure = stripperP - leansideDP_hotex; %calculated warm lean pressure

coldex_richsideDP_calculated = coldrichP_AFTERPUMP - warmrichP; %calculated cold exchanger rich side DP

coldex_leansideDP_calculated = warm_lean_pressure - coldleanP; %calculated cold exchanger, lean side DP

Loc1_coldrichP = ['FY' num2str(N1)];  % before rich pump // from absorber
Loc2_coldrichP = ['FY' num2str(N2)];
Loc_coldrichP = strcat(Loc1_coldrichP, ':', Loc2_coldrichP);
coldrichP = xlsread(filename,sheet, Loc_coldrichP);

Loc1_HXtop_CO2DP = ['GT' num2str(N1)];  %overhead exchanger CO2 side DP
Loc2_HXtop_CO2DP = ['GT' num2str(N2)];
Loc_HXtop_CO2DP = strcat(Loc1_HXtop_CO2DP, ':', Loc2_HXtop_CO2DP);
HXtop_CO2DP = xlsread(filename,sheet, Loc_HXtop_CO2DP);

Loc1_HXtop_amDP = ['GS' num2str(N1)];  %overhead exchanger solvent side DP
Loc2_HXtop_amDP = ['GS' num2str(N2)];
Loc_HXtop_amDP = strcat(Loc1_HXtop_amDP, ':', Loc2_HXtop_amDP);
HXtop_amDP = xlsread(filename,sheet, Loc_HXtop_amDP);

Loc1_MPsteampressure = ['HR' num2str(N1)];  %steam pressure for stripper sump, PSIG
Loc2_MPsteampressure = ['HR' num2str(N2)];
Loc_MPsteampressure = strcat(Loc1_MPsteampressure, ':', Loc2_MPsteampressure);
MPsteampressure = xlsread(filename,sheet, Loc_MPsteampressure);


data = zeros(X,13);

colNames = {'coldrichFR','hotleanFR','coldrichbypassFR','warmrichbypassFR','coldrich_intoHEX','sumptemperature','stripperP','CO2_flowrate','steam_flowrate','coldrichT','coldleanT','coldrichbypassT','warmrichbypassT'};
data(:,1) = coldrichFR;
data(:,2) = hotleanFR;
data(:,3) = coldrichbypassFR;
data(:,4) = warmrichbypassFR;
data(:,5) = coldrichFR1;
data(:,6) = sumptemperature;
data(:,7) = stripperP;
data(:,8) = CO2_flowrate;
data(:,9) = steam_flowrate;
data(:,10) = coldrichT;
data(:,11) = coldleanT;
data(:,12) = coldrichbypassT;
data(:,13) = warmrichbypassT;

table = array2table(data,'VariableNames',colNames);

x = [N1:1:N2];
y = coldrichFR;
y1 = hotleanFR;
y2 = coldrichbypassFR;
y3 = warmrichbypassFR;
y4 = CO2_flowrate;
y5 = steam_flowrate;
% y6 = removal;
y7 = stripperP;
y8 = sumptemperature;
y9 = coldrichT;
y10 = coldleanT;
y11 = coldrichbypassT;
y12 = warmrichbypassT;

plot(x,y)
hold on
plot(x,y1)
plot(x,y2)
plot(x,y3)
plot(x,y4)
plot(x,y5)
% plot(x,y6)
plot(x,y7)
plot(x,y8)
plot(x,y9)
plot(x,y10)
plot(x,y11)
plot(x,y12)

legend('RichFR', 'LeanFR', 'CRBP', 'WRBP', 'CO2', 'steam','removal','stripperP','sumpT','coldrichT','coldleanT','coldrichbypassT','warmrichbypassT')

mean_data = zeros(2,26); %average data
mean_data(2,1) = mean(coldrichFR); %lb/h - all flowrates
mean_data(2,2) = mean(hotleanFR);
mean_data(2,3) = mean(coldrichbypassFR);
mean_data(2,4) = mean(warmrichbypassFR);
mean_data(2,5) = mean(sumptemperature);
mean_data(2,6) = mean(stripperP); %psi - all pressures
mean_data(2,7) = mean(CO2_flowrate);
mean_data(2,8) = mean(steam_flowrate);
mean_data(2,9) = mean(removal); %
mean_data(2,10) = mean(coldrichT); % F - all temperatures
mean_data(2,11) = mean(coldleanT);
mean_data(2,12) = mean(coldrichbypassT);
mean_data(2,13) = mean(warmrichbypassT);
mean_data(2,14) = mean(coldrichP_AFTERPUMP);
mean_data(2,15) = mean(coldleanP);
mean_data(2,16) = mean(hotex_richsideDP_calculated);
mean_data(2,17) = mean(richsideDP_hotex); %from sensor
mean_data(2,18) = mean(leansideDP_hotex);
mean_data(2,19) = mean(warm_lean_pressure);
mean_data(2,20) = mean(coldex_richsideDP_calculated);
mean_data(2,21) = mean(coldex_leansideDP_calculated);
mean_data(2,22) = mean(coldrichP);
mean_data(2,23) = mean(warmrichT);
mean_data(2,24) = mean(warmleanT);
mean_data(2,25) = mean(hotrichT);
mean_data(2,26) = mean(hotleanT);
mean_data(2,27) = mean(richsideDP_hotex);
mean_data(2,28) = mean(leansideDP_hotex);
mean_data(2,29) = mean(HXtop_CO2DP);
mean_data(2,30) = mean(HXtop_amDP);
mean_data(2,31) = mean(steam_flowrate);
mean_data(2,32) = mean(MPsteampressure);

