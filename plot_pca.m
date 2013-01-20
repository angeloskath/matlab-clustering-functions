function h = plot_pca(idx,data)
    coeff = princomp(data);
    proj = zeros(length(data),2);
    proj(:,1) = data*coeff(1,:)';
    proj(:,2) = data*coeff(2,:)';
    
    n = max(idx);
    cmap = colormap(hsv(n));
    colors = ones(length(data),3);
    
    for j=1:n
        colors(idx==j,:) = ones(size(colors(idx==j,:),1),1)*cmap(j,:);
    end
    
    h = figure('Name','PCA plot','NumberTitle','off');
    scatter(proj(:,1),proj(:,2),[],colors,'filled');
end
