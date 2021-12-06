function forest = forestWalk(forest,invFreq,i)
if mod(i,invFreq)==0
    r = rand;
        if r < length(find(forest==2))*0.01
            [rows,cols]= find(forest==2);
            forest(rows,cols) = 0;          
        end
end
