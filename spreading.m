function  [forest, nrOfTrees] = spreading(forest,N,tree,nrOfTrees,meanTemp)

 row=randi(N);
 column=randi(N);
if meanTemp>=13 && forest(row,column)==1
    spreadProb=meanTemp*0.02; 
    if rand < spreadProb           %Ändra till korrekt sannolikhet senare
       forest(row,column)=3;
    end
      if length(find(forest==3))>0        
           [row,col]=find(forest==3);
         for n=1:length(row)
           if forest(min(row(n)+1,N),col(n))==1 && rand < spreadProb %Fixa rätt sannolikhet  
               forest(min(row(1)+1,N),col(n))=3;
           end
           if forest(max(row(n)-1,1),col(n))==1 && rand < spreadProb
               forest(max(row(n)-1,1),col(n))=3;
           end
           if forest(row(n),min(col(n)+1,N))==1 && rand < spreadProb
               forest(row(n),min(col(n)+1,N))=3;
           end
           if forest(row(n),max(col(n)-1,1))==1 && rand < spreadProb
               forest(row(n),max(col(n)-1,1))=3;
           end
           
           if forest(max(row(n)-1,1),max(col(n)-1,1))==1 && rand < spreadProb
               forest(max(row(n)-1,1),max(col(n)-1,1))=3; % Vänsterupp
           end
           
           if forest(min(row(n)+1,N),max(col(n)-1,1))==1 && rand < spreadProb
               forest(min(row(n)+1,N),max(col(n)-1,1))=3;   %VänsterNer
           end
           
           if forest(max(row(n)-1,1),min(col(n)+1,N))==1 && rand < spreadProb
               forest(max(row(n)-1,1),min(col(n)+1,N))=3;   %Högerupp
           end
           
           if forest(min(row(n)+1,N),min(col(n)+1,N))==1 && rand < spreadProb
               forest(min(row(n)+1,N),min(row(n)+1,N))= 3;   %Högerner
           end
           
           forest(row(n),col(n))=2;
           tree=tree+1;

      nrOfTrees=[nrOfTrees tree];
         end
      end
end
