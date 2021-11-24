function startForest=initForest(N,p)

startForest=zeros(N,N);
b=rand(N,N)<= p;
B = double(b);
startForest=startForest+B;
startForest=min(startForest,1);