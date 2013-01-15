function [idx C sse] = k_means_plot(data,cons,n)

    [idx C sse] = kmeans(data, n);
    hist(idx);
    figure (2);
    
    cmap = colormap(hsv(n));
    
    for j=1:n
        plot(cons(:,idx==j), 'Color', cmap(j,:));
        hold on
    end

end