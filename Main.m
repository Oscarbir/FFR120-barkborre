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
    forest=growth(forest,N,temp);
    if mod(i,invFreq)==0
        if rand < length(find(forest==2)*0.05)
            [rows,cols]= find(forest==2);
            forest(rows,cols) = 0;
            [rows1,cols1] = find(forest==1);
            hold off
            scatter(rows1,cols1,'g','.');

            
        end
    end
end

