function [idx s] = som_clust(input, cons, type, n, dim)

    if nargin < 5
        dim = [10 10];
    end

    net = newsom(input',dim);
    
    %~ net.trainParam.showCommandLine = 1;
    %~ net.trainParam.showWindow = 0;
    [net,tr] = train(net,input');
    
    data = sim(net,input')'*net.IW{1};
    Y = pdist(data);
    Z = linkage(Y);
    
    if strcmp(type,'maxclust')
        idx=cluster(Z,'maxclust',n);
    elseif strcmp(type,'cutoff')
        idx = cluster(Z,'cutoff',n,'criterion','distance');
        n=max(idx);
    end

    figure;
    [s h] = silhouette(input,idx);
    
    figure;
    hist(idx);
    figure;
       
    cmap = colormap(hsv(n));
    
    for j=1:n
        plot(cons(:,idx==j), 'Color', cmap(j,:));
        hold on
    end
    
    figure;
    plotsomnd(net);
    
end
