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
coldrichFR = xlsread(filename,sheet,Loc_coldrichFR); %cold rich flowrate

Loc1_coldrichP = ['BP' num2str(N1)];
Loc2_coldrichP = ['BP' num2str(N2)];
Loc_coldrichP = strcat(Loc1_coldrichP, ':', Loc2_coldrichP);
coldrichP = xlsread(filename,sheet,Loc_coldrichP); %cold rich pressure after rich pump

Loc1_coldrichT = ['BN' num2str(N1)];
Loc2_coldrichT = ['BN' num2str(N2)];
Loc_coldrichT = strcat(Loc1_coldrichT, ':', Loc2_coldrichT);
coldrichT = xlsread(filename,sheet,Loc_coldrichT); %cold rich temperature

Loc1_coldrichBPFR = ['GM' num2str(N1)];
Loc2_coldrichBPFR = ['GM' num2str(N2)];
Loc_coldrichBPFR = strcat(Loc1_coldrichBPFR, ':', Loc2_coldrichBPFR);
coldrichBPFR = xlsread(filename,sheet,Loc_coldrichBPFR); %cold rich bypass

Loc1_warmrichBPFR = ['GZ' num2str(N1)];
Loc2_warmrichBPFR = ['GZ' num2str(N2)];
Loc_warmrichBPFR = strcat(Loc1_warmrichBPFR, ':', Loc2_warmrichBPFR);
warmrichBPFR = xlsread(filename,sheet,Loc_warmrichBPFR); %warm rich bypass

Loc1_warmrichT = ['FU' num2str(N1)];
Loc2_warmrichT = ['FU' num2str(N2)];
Loc_warmrichT = strcat(Loc1_warmrichT, ':', Loc2_warmrichT);
warmrichT = xlsread(filename,sheet,Loc_warmrichT); %warm rich temperature

Loc1_warmleanT = ['FT' num2str(N1)];
Loc2_warmleanT = ['FT' num2str(N2)];
Loc_warmleanT = strcat(Loc1_warmleanT, ':', Loc2_warmleanT);
warmleanT = xlsread(filename,sheet, Loc_warmleanT); %warm lean T

Loc1_hotleanFR = ['BC' num2str(N1)];
Loc2_hotleanFR = ['BC' num2str(N2)];
Loc_hotleanFR = strcat(Loc1_hotleanFR, ':', Loc2_hotleanFR);
hotleanFR = xlsread(filename,sheet,Loc_hotleanFR); %hot lean FR

Loc1_CO2_flowrate = ['FF' num2str(N1)]; % lb/hr
Loc2_CO2_flowrate = ['FF' num2str(N2)];
Loc_CO2_flowrate = strcat(Loc1_CO2_flowrate, ':', Loc2_CO2_flowrate);
CO2_flowrate = xlsread(filename,sheet,Loc_CO2_flowrate); %CO2 flowrate

Loc1_stripperoverheadT = ['GV' num2str(N1)];
Loc2_stripperoverheadT = ['GV' num2str(N2)];
Loc_stripperoverheadT = strcat(Loc1_stripperoverheadT, ':', Loc2_stripperoverheadT);
stripperoverheadT = xlsread(filename,sheet,Loc_stripperoverheadT); %stripper overhead T

Loc1_CO2P = ['GU' num2str(N1)];
Loc2_CO2P = ['BQ' num2str(N2)];
Loc_CO2P = strcat(Loc1_CO2P, ':', Loc2_CO2P);
CO2P = xlsread(filename,sheet,Loc_CO2P); %CO2 pressure, PSIG

Loc1_coldrichBPexitT = ['IE' num2str(N1)];
Loc2_coldrichBPexitT = ['IE' num2str(N2)];
Loc_coldrichBPexitT = strcat(Loc1_coldrichBPexitT, ':', Loc2_coldrichBPexitT);
coldrichBPexitT = xlsread(filename,sheet,Loc_coldrichBPexitT); %cold rich BP exiting overhead exchanger

Loc1_CO2tocondenserT = ['GW' num2str(N1)];
Loc2_CO2tocondenserT = ['GW' num2str(N2)];
Loc_CO2tocondenserT = strcat(Loc1_CO2tocondenserT, ':', Loc2_CO2tocondenserT);
CO2tocondenserT = xlsread(filename,sheet,Loc_CO2tocondenserT); %product temperature_to condenser

Loc1_hotleanT = ['HI' num2str(N1)];
Loc2_hotleanT = ['HI' num2str(N2)];
Loc_hotleanT = strcat(Loc1_hotleanT, ':', Loc2_hotleanT);
hotleanT = xlsread(filename,sheet, Loc_hotleanT); %hot lean temperature

Loc1_coldleanT = ['FV' num2str(N1)];
Loc2_coldleanT = ['FV' num2str(N2)];
Loc_coldleanT = strcat(Loc1_coldleanT, ':', Loc2_coldleanT);
coldleanT = xlsread(filename,sheet, Loc_coldleanT); %cold lean temperature

Loc1_LLDG = ['KF' num2str(N1)];
Loc2_LLDG = ['KF' num2str(N2)];
Loc_LLDG = strcat(Loc1_LLDG, ':', Loc2_LLDG);
LLDG = xlsread(filename,sheet,Loc_LLDG); %density-viscosity lean loading

Loc1_RLDG = ['KG' num2str(N1)];
Loc2_RLDG = ['KG' num2str(N2)];
Loc_RLDG = strcat(Loc1_RLDG, ':', Loc2_RLDG);
RLDG = xlsread(filename,sheet,Loc_RLDG); %density-viscosity rich loading

Loc1_hotrichT = ['HM' num2str(N1)];
Loc2_hotrichT = ['HM' num2str(N2)];
Loc_hotrichT = strcat(Loc1_hotrichT, ':', Loc2_hotrichT);
hotrichT = xlsread(filename,sheet,Loc_hotrichT); %hotrichT

Loc1_stripperP = ['GU' num2str(N1)]; %% PSIG
Loc2_stripperP = ['GU' num2str(N2)];
Loc_stripperP = strcat(Loc1_stripperP, ':', Loc2_stripperP);
stripperP = xlsread(filename,sheet,Loc_stripperP);

Loc1_leansideDP_hotex = ['HH' num2str(N1)]; %differential pressure sensor value, lean side, hot exchanger
Loc2_leansideDP_hotex = ['HH' num2str(N2)];
Loc_leansideDP_hotex = strcat(Loc1_leansideDP_hotex, ':', Loc2_leansideDP_hotex);
leansideDP_hotex = xlsread(filename,sheet, Loc_leansideDP_hotex);

data = zeros(X,17);

colNames = {'coldrichFR','coldrichP','coldrichT','CRBPFR','WRBPFR','warmrichT','warmleanT','hotleanFR','CRBP_EXIT_T_overhead','CO2tocondenserT','hotleanT','coldleanT','LLDG','RLDG','hotrichT','stripperP','hotexleansideDP','stripperoverheadT'};
data(:,1) = coldrichFR;
data(:,2) = coldrichP;
data(:,3) = coldrichT;
data(:,4) = coldrichBPFR;
data(:,5) = warmrichBPFR;
data(:,6) = warmrichT;
data(:,7) = warmleanT;
data(:,8) = hotleanFR;
data(:,9) = coldrichBPexitT;
data(:,10) = CO2tocondenserT;
data(:,11) = hotleanT;
data(:,12) = coldleanT;
data(:,13) = LLDG;
data(:,14) = RLDG;
data(:,15) = hotrichT;
data(:,16) = stripperP;
data(:,17) = leansideDP_hotex;
data(:,18) = stripperoverheadT;

table = array2table(data,'VariableNames',colNames);

mean_data = zeros(2,215); %average data
mean_data(2,1) = mean(coldrichFR); %lb/h - all flowrates
mean_data(2,2) = mean(coldrichP);
mean_data(2,3) = mean(coldrichT);
mean_data(2,4) = mean(coldrichBPFR);
mean_data(2,5) = mean(warmrichBPFR);
mean_data(2,6) = mean(warmrichT); %psi - all pressures
mean_data(2,7) = mean(warmleanT);
mean_data(2,8) = mean(hotleanFR);
mean_data(2,9) = mean(coldrichBPexitT); %
mean_data(2,10) = mean(CO2tocondenserT); % F - all temperatures
mean_data(2,11) = mean(hotleanT);
mean_data(2,12) = mean(coldleanT);
mean_data(2,13) = mean(RLDG);
mean_data(2,14) = mean(LLDG);
mean_data(2,15) = mean(hotrichT);
mean_data(2,16) = mean(stripperP);
mean_data(2,17) = mean(leansideDP_hotex);
mean_data(2,18) = mean(stripperoverheadT);

