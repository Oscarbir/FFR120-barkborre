function  [forest, nrOfTrees] = spreading(forest,N,tree,nrOfTrees,meanTemp)

 row=randi(N);
 column=randi(N);
if meanTemp>=13 && forest(row,column)==1
    spreadProb=meanTemp*0.02; 
    if rand < spreadProb           %Ändra till korrekt sannolikhet senare
       forest(row,column)=2;
    end
      if length(find(forest==2))>0        
           [row,col]=find(forest==2);

           if forest(min(row(1)+1,N),col(1))==1 && rand < spreadProb %Fixa rätt sannolikhet  
               forest(min(row(1)+1,N),col(1))=2;
           end
           if forest(max(row(1)-1,1),col(1))==1 && rand < spreadProb
               forest(max(row(1)-1,1),col(1))=2;
           end
           if forest(row(1),min(col(1)+1,N))==1 && rand < spreadProb
               forest(row(1),min(col(1)+1,N))=2;
           end
           if forest(row(1),max(col(1)-1,1))==1 && rand < spreadProb
               forest(row(1),max(col(1)-1,1))=2;
           end
           
           if forest(max(row(1)-1,1),max(col(1)-1,1))==1 && rand < spreadProb
               forest(max(row(1)-1,1),max(col(1)-1,1))=2; % Vänsterupp
           end
           
           if forest(min(row(1)+1,N),max(col(1)-1,1))==1 && rand < spreadProb
               forest(min(row(1)+1,N),max(col(1)-1,1))=2;   %VänsterNer
           end
           
           if forest(max(row(1)-1,1),min(col(1)+1,N))==1 && rand < spreadProb
               forest(max(row(1)-1,1),min(col(1)+1,N))=2;   %Högerupp
           end
           
           if forest(min(row(1)+1,N),min(col(1)+1,N))==1 && rand < spreadProb
               forest(min(row(1)+1,N),min(row(1)+1,N))= 2;   %Högerner
           end
           
           forest(row(n),col(n))=2;
           tree=tree+1;

      nrOfTrees=[nrOfTrees tree];
         end
      end
end
