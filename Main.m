clc, clear all, close all;

N=16;
p=0.7;
f=0.2;
[B, T] = xlsread('temperaturdata.xlsx');

forest=initForest(N,p);
%%
nrOfTrees=[];

while length(nrOfTrees)<500 
    tree=0;
    forest=growth(forest,p,N);
     row=randi(N);
     column=randi(N);
   if rand<=f && forest(row,column)==1
           forest(row,column)=3;
           while find(forest==3)               
               [row,col]=find(forest==3);

               if forest(min(row(1)+1,N),col(1))==1
                   forest(min(row(1)+1,N),col(1))=3;
               end
               if forest(max(row(1)-1,1),col(1))==1
                   forest(max(row(1)-1,1),col(1))=3;
               end
               if forest(row(1),min(col(1)+1,N))==1
                   forest(row(1),min(col(1)+1,N))=3;
               end
               if forest(row(1),max(col(1)-1,N))==1
                   forest(row(1),max(col(1)+1,N))=3;
               end
               forest(row(1),col(1))=2;
               tree=tree+1;
           end

      [Rows1,Cols1] = find(forest==1);
      [Rows2,Cols2] = find(forest==2);
       scatter(Rows1,Cols1,'g','.');
       hold on
       scatter(Rows2,Cols2,'r','.');
       pause(0.3)
       forest(Rows2,Cols2)=0;
       hold off
       scatter(Rows1,Cols1,'g','.');

       nrOfTrees=[nrOfTrees tree];

   end

end
    