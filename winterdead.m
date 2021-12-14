function forest=winterdead(forest)
[row,col]=find(forest==2);
for step=1:length(row)
  if rand<=0.4
     forest(row(step),col(step))=1;
  end
end