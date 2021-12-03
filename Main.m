clc, clear all, close all;
N=25;
p=0.01;
densityOfForest=0.7;
f=0.2;
%<<<<<<< Updated upstream
TempList=matfile('templist.mat');
TempList = TempList.TempList;
%TempList = TempList(1447:2670) % 1696 period
forest=initForest(N,densityOfForest);
meanTemp=[];
for i=1:8:60504
   meanTemp=[meanTemp sum(TempList(i:i+7))/8] ;
end

[B, T] = xlsread('temperaturdata.xlsx');
T = [T(:,1) cellfun(@str2num, T(:,2:end))]
TempList = zeros(60504,1);
for i=1:60504
    y = T(i);
    x = cell2mat(y);
    TempList(i) = str2double(x);
end
TempList = TempList(1447:2670) % 1696 period
%forest=initForest(N,densityOfForest);
%>>>>>>> Stashed changes
%test
%%
nrOfTrees=[];

for i=1:length(meanTemp) 
    tree=0;
    temp=meanTemp(i);
    [forest, nrOfTrees]=spreading(forest,N,tree,nrOfTrees,temp); 
    forest=growth(forest,N,temp);
end

