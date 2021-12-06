function forest = forestWalk(forest,invFreq,i)
if mod(i,invFreq)==0
        if rand < length(find(forest==2)*0.05)
            [rows,cols]= find(forest==2);
            forest(rows,cols) = 0;
            [rows1,cols1] = find(forest==1);
            hold off
            scatter(rows1,cols1,'g','.');
        end
end