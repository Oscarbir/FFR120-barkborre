clc, clear all, close all;

N=16;
p=0.01;
densityOfForest=0.7;
f=0.2;
[B, T] = xlsread('temperaturdata.xlsx');

forest=initForest(N,densityOfForest);
%%
nrOfTrees=[];

while length(nrOfTrees)<100 
    tree=0;
    forest=growth(forest,p,N);
    [forest, nrOfTrees]=spreading(forest,f,N,tree,nrOfTrees); 

end
    