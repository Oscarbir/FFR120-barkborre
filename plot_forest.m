function plot_forest(forest,meanTemp,t,N)
    hold on
    pl=subplot(11,1,9:11);
    pl.Position = [0.395 0.1 0.25 0.2];
    
    hold on
    plot(max(1,t-80):t,meanTemp(max(1,t-80):t),'g-')
    axis([t-80 t -30 30])
    scatter(t,meanTemp(t),5,'ko','filled')
    xlabel('Days')
    ylabel('Daytime average temperature')
    title('Temperature as a function of time')
    
    
    subplot(11,1,1:7);
    hold off
    [Rows1,Cols1] = find(forest==1);
    [Rows2,Cols2] = find(forest==2);
    scatter(Rows1,Cols1,'g','.');
    hold on
    scatter(Rows2,Cols2,'k','.');
    axis([0 N 0 N])
    axis square
    set(gca,'xtick',[],'ytick',[])
    set(gca,'XColor','none','YColor','none','TickDir','out')
    title('Forest map, green=alive, black=infected')
    pause(0.1)
    
end
