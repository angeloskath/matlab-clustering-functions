function [idx s similarity_mat] = hier_clust(data, cons, type, n)

    Y = pdist(data); 
    dist = squareform(Y);
    Z = linkage(Y);
    dendrogram(Z);
    if strcmp(type,'maxclust')
        idx=cluster(Z,'maxclust',n);
    elseif strcmp(type,'cutoff')
        idx = cluster(Z,'cutoff',n,'criterion','distance');
        n=max(idx);
    end
    
    figure(4)
    [s h] = silhouette(data,idx);
    similarity_mat = exp(-dist);
    
    figure(2)
    hist(idx);
    figure (3);
       
    cmap = colormap(hsv(n));
    
    for j=1:n
        plot(cons(:,idx==j), 'Color', cmap(j,:));
        hold on
    end
    
end