function newForest = growth(forest, p, N,meanTemp)

if meanTemp>5 && meanTemp<18 %För att plantera träd får det inte vara för kallt men man vill att marken ska vara fuktig så inte högsommar.
 [x,y]=find(forset==0);
 randx=randi(x);
 randy=randi(y)
    for j=1:N
     for k=1:N   
       if rand<=p && forest(j,k)==0              
           forest(j,k)=1;
            
       end
     end
 end
end
 newForest=forest;