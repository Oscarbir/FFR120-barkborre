function newForest = growth(forest,N,meanTemp)

if meanTemp>5 && meanTemp<18 %För att plantera träd får det inte vara för kallt men man vill att marken ska vara fuktig så inte högsommar.
 [x,y]=find(forest==0);
 if not(isempty(x)) && length(find(forest~=0))< 0.7*N*N
 randx=randi(length(x));
 randy=randi(length(y));
 forest(x(randx),y(randy))=1;

           if forest(min(x(randx)+1,N),y(randy))==0
               forest(min(x(randx)+1,N),y(randy))=1;
           end
           if forest(max(x(randx)-1,1),y(randy))==0
               forest(max(x(randx)-1,1),y(randy))=1;
           end
           if forest(x(randx),min(y(randy)+1,N))==0
               forest(x(randx),min(y(randy)+1,N))=1;
           end
           if forest(x(randx),max(y(randy)-1,1))==0
               forest(x(randx),max(y(randy)-1,1))=1;
           end
           
           if forest(max(x(randx)-1,1),max(y(randy)-1,1))==0
               forest(max(x(randx)-1,1),max(y(randy)-1,1))=1; % Vänsterupp
           end
           
           if forest(min(x(randx)+1,N),max(y(randy)-1,1))==0 
               forest(min(x(randx)+1,N),max(y(randy)-1,1))=1;   %VänsterNer
           end
           
           if forest(max(x(randx)-1,1),min(y(randy)+1,N))==0 
               forest(max(x(randx)-1,1),min(y(randy)+1,N))=1;   %Högerupp
           end
           
           if forest(min(x(randx)+1,N),min(y(randy)+1,N))==0
               forest(min(x(randx)+1,N),min(y(randy)+1,N))= 1;   %Högerner
           end
           
 end
end
 newForest=forest;