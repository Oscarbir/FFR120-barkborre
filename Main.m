clc, clear all, close all;
N=16;
p=0.01;
densityOfForest=0.7;
f=0.2;
TempList=matfile('templist.mat');
TempList = TempList.TempList;
%TempList = TempList(1447:2670) % 1696 period
forest=initForest(N,densityOfForest);
meanTemp=[];
for i=1:8:60504
   meanTemp=[meanTemp sum(TempList(i:i+7))/8] ;
end
%%
nrOfTrees=[];

while length(nrOfTrees)<100 
    tree=0;
    forest=growth(forest,p,N);
    [forest, nrOfTrees]=spreading(forest,f,N,tree,nrOfTrees); 
    
end