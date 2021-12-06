function plot_forest(forest,meanTemp,t)
    hold on
    pl=subplot(11,1,9:11);
    pl.Position = [0.395 0.1 0.25 0.2];
    
    hold on
    max(1,t-40)
    plot(max(1,t-40):t,meanTemp(max(1,t-40):t),'g-')
    axis([t-40 t -30 30])
    
    subplot(11,1,1:7);
    hold on
    [Rows1,Cols1] = find(forest==1);
    [Rows2,Cols2] = find(forest==2);
    scatter(Rows1,Cols1,'g','.');
    scatter(Rows2,Cols2,'k','.');
    axis square
    pause(0.3)
    
end
