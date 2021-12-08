function newForest = growth(forest,N,meanTemp,dense)

if meanTemp>3 && meanTemp<20 %För att plantera träd får det inte vara för kallt men man vill att marken ska vara fuktig så inte högsommar.
 [x,y]=find(forest==0);
 if not(isempty(x)) && length(find(forest~=0))< dense*N*N
 randx=randi(length(x));

 forest(x(randx),y(randx))=1;

           if forest(min(x(randx)+1,N),y(randx))==0
               forest(min(x(randx)+1,N),y(randx))=1;
           end
           if forest(max(x(randx)-1,1),y(randx))==0
               forest(max(x(randx)-1,1),y(randx))=1;
           end
           if forest(x(randx),min(y(randx)+1,N))==0
               forest(x(randx),min(y(randx)+1,N))=1;
           end
           if forest(x(randx),max(y(randx)-1,1))==0
               forest(x(randx),max(y(randx)-1,1))=1;
           end
           
           if forest(max(x(randx)-1,1),max(y(randx)-1,1))==0
               forest(max(x(randx)-1,1),max(y(randx)-1,1))=1; % Vänsterupp
           end
           
           if forest(min(x(randx)+1,N),max(y(randx)-1,1))==0 
               forest(min(x(randx)+1,N),max(y(randx)-1,1))=1;   %VänsterNer
           end
           
           if forest(max(x(randx)-1,1),min(y(randx)+1,N))==0 
               forest(max(x(randx)-1,1),min(y(randx)+1,N))=1;   %Högerupp
           end
           
           if forest(min(x(randx)+1,N),min(y(randx)+1,N))==0
               forest(min(x(randx)+1,N),min(y(randx)+1,N))= 1;   %Högerner
           end
           
 end
end
 newForest=forest;