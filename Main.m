clc, clear all, close all;
suminfect=[];
for n=0:0.05:2
    N=50;
    p=0.01;
    densityOfForest=0.8;
    f=0.2;
    rng(1);

    TempList=matfile('templist.mat');
    TempList = TempList.TempList;
    forest=initForest(N,densityOfForest);
    meanTemp=[];
    for i=1:8:60504
       meanTemp=[meanTemp sum(TempList(i+4:i+7))/4] ;
    end

    nrOfTrees=[];
    invFreq = 10;

    tempdiff=n*rand(1,length(meanTemp))-n/4;
    b=meanTemp+tempdiff;
    infected=[];
    for i=1:length(meanTemp)
        tree=0;
        temp=b(i);
        [forest, nrOfTrees]=spreading(forest,N,tree,nrOfTrees,temp);    
%         if mod(i,10)==1
%           plot_forest(forest,meanTemp(1:i),i)
%         end
        forest = forestWalk(forest,invFreq,i);
        forest=growth(forest,N,temp,densityOfForest);
        if mod(i,365)==1
          infected=[infected sum(nrOfTrees)];
          nrOfTrees=[];
        end
    end
    suminfect=[suminfect sum(infected)];
end
figure(2)
plot(1:41,suminfect)
axis([0 41 0 18000])