function  [forest, nrOfTrees] = spreading(forest,N,tree,nrOfTrees,meanTemp)

 row=randi(N);
 column=randi(N);
if meanTemp>=13 && forest(row,column)==1
    spreadProb=-0.26+meanTemp*0.02; 
    if rand < spreadProb           %Ändra till korrekt sannolikhet senare
       forest(row,column)=3;
    end
       while find(forest==3)               
           [row,col]=find(forest==3);

           if forest(min(row(1)+1,N),col(1))==1 && rand < spreadProb %Fixa rätt sannolikhet  
               forest(min(row(1)+1,N),col(1))=3;
           end
           if forest(max(row(1)-1,1),col(1))==1 && rand < spreadProb
               forest(max(row(1)-1,1),col(1))=3;
           end
           if forest(row(1),min(col(1)+1,N))==1 && rand < spreadProb
               forest(row(1),min(col(1)+1,N))=3;
           end
           if forest(row(1),max(col(1)-1,1))==1 && rand < spreadProb
               forest(row(1),max(col(1)-1,1))=3;
           end
           
           if forest(max(row(1)-1,1),max(col(1)-1,1))==1 && rand < spreadProb
               forest(max(row(1)-1,1),max(col(1)-1,1))=3; % Vänsterupp
           end
           
           if forest(max(row(1)-1,1),max(col(1)-1,1))==1 && rand < spreadProb
               forest(min(row(1)+1,N),max(col(1)-1,N))=3;   %VänsterNer
           end
           
           if forest(max(row(1)-1,1),max(col(1)-1,1))==1 && rand < spreadProb
               forest(max(row(1)-1,1),min(col(1)-1,N))=3;   %Högerupp
           end
           
           if forest(max(row(1)-1,1),max(col(1)-1,1))==1 && rand < spreadProb
               forest(min(row(1)+1,N),min(row(1)+1,N))= 3;   %Högerner
           end
           
           forest(row(1),col(1))=2
           tree=tree+1;
       end
  [Rows1,Cols1] = find(forest==1);
  [Rows2,Cols2] = find(forest==2);
   forest(Rows2,Cols2)=2;
   %hold off
   %scatter(Rows1,Cols1,'g','.');

   nrOfTrees=[nrOfTrees tree];

end
