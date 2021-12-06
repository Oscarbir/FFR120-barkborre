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
%%
close all
nrOfTrees=[];
invFreq = 10;

for i=1:length(meanTemp)
    tree=0;
    temp=meanTemp(i);
    [forest, nrOfTrees]=spreading(forest,N,tree,nrOfTrees,temp);    
    if mod(i,10)==0
      plot_forest(forest,meanTemp,i)
    end
    forest = forestWalk(forest,invFreq,i);
    forest=growth(forest,N,temp);
end

