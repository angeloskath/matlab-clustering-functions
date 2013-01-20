function [idx C sse] = k_means_clust(data,cons,n)

    [idx C sse] = kmeans(data, n);
    figure;
    hist(idx);
    figure;
    
    cmap = colormap(hsv(n));
    
    for j=1:n
        plot(cons(:,idx==j), 'Color', cmap(j,:));
        hold on
    end

end