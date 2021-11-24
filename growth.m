function newForest = growth(forest, p, N)

 for j=1:N
     for k=1:N   
       if rand<=p && forest(j,k)==0              
           forest(j,k)=1;
%            [Rows1,Cols1] = find(forest==1);
%            [Rows2,Cols2] = find(forest==2);
%            scatter(Rows1,Cols1,'g','.');
%            hold on

       end
     end
 end
 newForest=forest;