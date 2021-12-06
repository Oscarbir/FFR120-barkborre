function plot_forest(forest,meanTemp,t)
    
    subplot(11,1,1:7)
    hold off
    [Rows1,Cols1] = find(forest==1);
    [Rows2,Cols2] = find(forest==2);
    scatter(Rows1,Cols1,'g','.');
    hold on
    scatter(Rows2,Cols2,'k','.');
    axis square
    pl=subplot(11,1,9:11);
    pl.Position = [0.395 0.1 0.25 0.2];
    if t>1
        hold on
        plot([t-1 t],[meanTemp(t-1) meanTemp(t)],'g-')
        axis([t-40 t -30 30])
        pause(0.3)
    end
end
