[B, T] = xlsread('temperaturdata.xlsx');
T=T(:,3);
T = [T(:,1) cellfun(@str2num, T(:,2:end))];
TempList = zeros(60504,1);
for i=1:60504
    y = T(i);
    x = cell2mat(y);
    TempList(i) = str2double(x);
end
