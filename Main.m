clc, clear all, close all;

N=16;
p=0.01;
densityOfForest=0.7;
f=0.2;
[B, T] = xlsread('temperaturdata.xlsx');
T = [T(:,1) cellfun(@str2num, T(:,2:end))]
TempList = zeros(60504,1);
for i=1:60504
    y = T(i);
    x = cell2mat(y);
    TempList(i) = str2double(x);
end

TempList = TempList(1447:2670) % 1696 period

forest=initForest(N,densityOfForest);
%%
nrOfTrees=[];

while length(nrOfTrees)<100 
    tree=0;
    forest=growth(forest,p,N);
    [forest, nrOfTrees]=spreading(forest,f,N,tree,nrOfTrees); 
    
end