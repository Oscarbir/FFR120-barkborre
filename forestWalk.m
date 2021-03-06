function forest = forestWalk(forest,invFreq,i,N)
if mod(i,invFreq)==0
    r = rand;
        if r < length(find(forest==2))*0.01
            [rows,cols]= find(forest==2);
            %forest(rows,cols) = 0;
            found = true;
        else
            found = false;
        end
   if found
   r=randi(length(rows));
   forest(rows(r),cols(r))=4;
       while find(forest==4)
           [row,col]=find(forest==4);

           if forest(min(row(1)+1,N),col(1))==2
               forest(min(row(1)+1,N),col(1))=4;
           end
           if forest(max(row(1)-1,1),col(1))==2
               forest(max(row(1)-1,1),col(1))=4;
           end
           if forest(row(1),min(col(1)+1,N))==2
               forest(row(1),min(col(1)+1,N))=4;
           end
           if forest(row(1),max(col(1)-1,N))==2
               forest(row(1),max(col(1)+1,N))=4;
           end
           
           if forest(max(row(1)-1,1),max(col(1)-1,1))==2
               forest(max(row(1)-1,1),max(col(1)-1,1))=4; % Vänsterupp 
           end 
            
           if forest(min(row(1)+1,N),max(col(1)-1,1))==2
               forest(min(row(1)+1,N),max(col(1)-1,1))=4;   %VänsterNer 
           end 
            
           if forest(max(row(1)-1,1),min(col(1)+1,N))==2
               forest(max(row(1)-1,1),min(col(1)+1,N))=4;   %Högerupp 
           end 
            
           if forest(min(row(1)+1,N),min(col(1)+1,N))==2
               forest(min(row(1)+1,N),min(row(1)+1,N))=4;   %Högerner 
           end 
           forest(row(1),col(1))=0;

       end
   end
end
