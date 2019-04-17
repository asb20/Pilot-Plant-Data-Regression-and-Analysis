clc
clear
filename = 'UT Austin Data 4-10-19 master';
sheet = 1;

N1 = 305; %start position
N2 = 365; %end position
X = N2-N1 +1;

Loc1_PZconc = ['KE' num2str(N1)];
Loc2_PZconc = ['KE' num2str(N2)];
Loc_PZconc = strcat(Loc1_PZconc, ':', Loc2_PZconc);
PZconc = xlsread(filename,sheet,Loc_PZconc); %Piperazine measured molality

data = zeros(X,1);

colNames = {'PZmolality'};
data(:,1) = PZconc;

table = array2table(data,'VariableNames',colNames);

mean_data = zeros(2,26);
mean_data(2,1) = mean(PZconc);


