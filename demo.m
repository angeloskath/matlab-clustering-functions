clear all; close all; clc;
load('data_norm.mat');
ch = input('WARNING! Dragons ahead!\nAre you sure you want to continue? (y/n)\n','s');

if ch=='y'||ch=='Y'

	fprintf('Starting clustering with k-means algorithm on hours_avg_norm dataset\n');

	[idx C sse] = k_means_clust(hours_avg_norm, hours_avg_norm', 4);
	h = figure(2);
	title('Normalized consumptions per 4-hour time period');
	xlabel('Time periods');
	set(gca, 'XTick', [1:6]);
	set(gca,'XTickLabel',{'00:00-04:00','04:00-08:00','08:00-12:00','12:00-16:00','16:00-20:00','20:00-24:00'});

	plot_pca(idx,hours_avg_norm);
	title('Cluster plot with dimension reduction to the two first principal components');
	xlabel('First Principal Component');
	ylabel('Second Principal Component');

	figure;
	[s h] = silhouette(hours_avg_norm,idx);

	figure;
	image(blur_heatmap(heatmap(idx,hours_avg_norm),10));
	set(gca, 'XTick', [50:50:450]);
	set(gca, 'XTickLabel', [5:5:45]);
	set(gca, 'YTick', [50:50:450]);
	set(gca, 'YTickLabel', [5:5:45]);

	table = [sum(sse) mean(s) corr(idx, hours_avg_norm)];
	colnam = {'SSE','Silhouette','Correlation'};
	h = figure('Name','Metrics','NumberTitle','off','Position',[200 200 400 150]);
	rownam = {'k-means'};
	uitable('Parent',h,'Data',table,'ColumnName',colnam,'RowName',rownam,'Position',[20 20 360 130]);

	fprintf('Press Enter to continue to hierarchical clustering\n'); 
	pause;
	close all;
	%------------------------------------------

	[idx s sim_mat] = hier_clust(hours_avg_norm,hours_avg_norm','maxclust',4);

	[C sse] = clus_sse(idx,hours_avg_norm);

	h = figure(4);
	title('Normalized consumptions per 4-hour time period');
	xlabel('Time periods');
	set(gca, 'XTick', [1:6]);
	set(gca,'XTickLabel',{'00:00-04:00','04:00-08:00','08:00-12:00','12:00-16:00','16:00-20:00','20:00-24:00'});

	plot_pca(idx,hours_avg_norm);
	title('Cluster plot with dimension reduction to the two first principal components');
	xlabel('First Principal Component');
	ylabel('Second Principal Component');

	figure;
	image(blur_heatmap(heatmap(idx,hours_avg_norm),10));
	set(gca, 'XTick', [50:50:450]);
	set(gca, 'XTickLabel', [5:5:45]);
	set(gca, 'YTick', [50:50:450]);
	set(gca, 'YTickLabel', [5:5:45]);

	table = [table; sum(sse) mean(s) corr(idx, hours_avg_norm)]; 
	h = figure('Name','Metrics','NumberTitle','off','Position',[200 200 400 150]);
	rownam = {'k-means','hierarchical'};
	uitable('Parent',h,'Data',table,'ColumnName',colnam,'RowName',rownam,'Position',[20 20 360 130]);

	fprintf('Press Enter to continue to Self Organizing Maps\n'); 
	pause;
	close all;
	%------------------------------------------

	[idx s] = som_clust(hours_avg_norm,hours_avg_norm','cutoff',0.2,[5 5]);

	h = figure(3);
	title('Normalized consumptions per 4-hour time period');
	xlabel('Time periods');
	set(gca, 'XTick', [1:6]);
	set(gca,'XTickLabel',{'00:00-04:00','04:00-08:00','08:00-12:00','12:00-16:00','16:00-20:00','20:00-24:00'});

	plot_pca(idx,hours_avg_norm);
	title('Cluster plot with dimension reduction to the two first principal components');
	xlabel('First Principal Component');
	ylabel('Second Principal Component');

	[C sse] = clus_sse(idx,hours_avg_norm);
	table = [table; sum(sse) mean(s) corr(idx, hours_avg_norm)];

	h = figure('Name','Metrics','NumberTitle','off','Position',[200 200 400 150]);
	rownam = {'k-means','hierarchical','SOM'};
	uitable('Parent',h,'Data',table,'ColumnName',colnam,'RowName',rownam,'Position',[20 20 360 130]);

	fprintf('Enter to close all windows\n');
	pause;
	close all;
end
