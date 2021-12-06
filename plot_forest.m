function plot_forest(forest,t)
    clf
    subplot(11,1,1:7)
    axis square
    [Rows1,Cols1] = find(forest==1);
    [Rows2,Cols2] = find(forest==2);
    scatter(Rows1,Cols1,'g','.');
    scatter(Rows2,Cols2,'k','.');
    pl=subplot(11,1,9:11);
    pl.Position = [0.395 0.1 0.25 0.2];
    if t>1
        plot([t-1 t],[meanTemp(t-1) meanTemp(t)],'g-')
        hold on
        axis([t-40 t -30 30])
        pause(0.3)
    end
end