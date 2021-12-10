clc, clear all, close all;
matrix=zeros([15, 101]);
for look=1:5
suminfect=[];
%Kanske borde göra ytterliggare någon loop för att ändra hur ofta
%skogsbrukaren letar inektion samt planterar.
disp(look)
q = 1;
for n=0:0.01:1
    q = q+1;
    N=25;
    densityOfForest=0.8;
    rng(1);

    TempList=matfile('templist.mat');
    TempList = TempList.TempList;
    forest=initForest(N,densityOfForest);
    meanTemp=[];
    for i=1:8:60504
       meanTemp=[meanTemp sum(TempList(i+4:i+7))/4] ;
    end

    nrOfTrees=[];
    invFreq = look*2;

    tempdiff=normrnd(n,0.5,[1,length(meanTemp)]);
    b=meanTemp+tempdiff;
    infected=[];
    for i=1:length(meanTemp)
        tree=0;
        temp=b(i);
        [forest, nrOfTrees]=spreading(forest,N,tree,nrOfTrees,temp);    
%         if mod(i,10)==1
%           plot_forest(forest,meanTemp(1:i),i,N)
%         end
        forest = forestWalk(forest,invFreq,i,N);
        forest=growth(forest,N,temp,densityOfForest);
        if mod(i,365)==1
          infected=[infected sum(nrOfTrees)];
          nrOfTrees=[];
          forest=winterdead(forest);
        end
    end
    %suminfect=[suminfect sum(infected)];
    matrix(look, q) = sum(infected);
end

% figure(look)
% x1 = 0:0.01:1;
% plot(x1,suminfect)
% axis([0 1 800 40000])
% hold on
% varInfect = var(suminfect);
% fprintf('Std: %d',varInfect)
% p = polyfit(x1,suminfect,1);
% y1 = polyval(p,x1);
% plot(x1,y1);
% ylabel('Infected trees over 20 years')
% xlabel('Mean increase of temperature')

end

%%

imagesc(matrix)
xticks([1, 11, 21, 31, 41, 51, 61, 71, 81, 91, 101])
yticks([5, 10, 15, 20, 25, 30])
xticklabels({'0.0','0.1','0.2','0.3' ,'0.4','0.5','0.6', '0.7', '0.8', '0.9', '1.0'})
yticklabels({'10', '20', '30', '40', '50', '60'})
ylabel('Frequency of devastation')
xlabel('Mean increase in temperature')
