clc
clear
filename = 'UT Austin Data 4-10-19 master';
sheet = 1;

N1 = 305; %start position
N2 = 365; %end position
X = N2-N1 +1;

Loc1_richT2stripper = ['ID' num2str(N1)];
Loc2_richT2stripper = ['ID' num2str(N2)];
Loc_richT2stripper = strcat(Loc1_richT2stripper, ':', Loc2_richT2stripper);
richT2stripper = xlsread(filename,sheet,Loc_richT2stripper); %temperature of warm rich entering stripper
data = zeros(X,1);

colNames = {'richT2stripper'};
data(:,1) = richT2stripper;

table = array2table(data,'VariableNames',colNames);

mean_data = zeros(2,26);
mean_data(2,1) = mean(richT2stripper);