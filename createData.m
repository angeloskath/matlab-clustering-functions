clear all

load('raw_data.mat');

% to plot the average consumptions per store
avg_consumptions = data2store(mean(data,2),49,1)';

% skip the first 24 days and transform the data so one row has all the data
% for one store
data2use = data(24*49+1:end,:);
dates2use = dates(24*49+1:end,:);
all_data = data2store(data2use);

% months and days to be used to filter and aggregate the data
months = ['01';'02';'03';'04';'05';'06';'07';'08';'09';'10';'11';'12'];
days = ['Mon'; 'Tue'; 'Wed'; 'Thu'; 'Fri'; 'Sat'; 'Sun'];

% parse the date strings to date vectors
dates_vector = zeros(length(dates),6);
dates_vector(:,1) = str2num(dates(:,7:10));
dates_vector(:,2) = str2num(dates(:,4:5));
dates_vector(:,3) = str2num(dates(:,1:2));
dates_vector2use = dates_vector(24*49+1:end,:);

% aggregate months
months_max = aggregate_data(months,@(x) @(y,i)y(4:5)==x,data2use,dates2use,@(x) max(x,[],2));
months_min = aggregate_data(months,@(x) @(y,i)y(4:5)==x,data2use,dates2use,@(x) min(x,[],2));
months_avg = aggregate_data(months,@(x) @(y,i)y(4:5)==x,data2use,dates2use,@(x) mean(x,2));

% aggregate days
days_avg = aggregate_data(days,@(x) @(y,i)datestr(y,'ddd')==x,data2use,dates_vector2use,@(x) mean(x,2));
days_min = aggregate_data(days,@(x) @(y,i)datestr(y,'ddd')==x,data2use,dates_vector2use,@(x) min(x,[],2));
days_max = aggregate_data(days,@(x) @(y,i)datestr(y,'ddd')==x,data2use,dates_vector2use,@(x) max(x,[],2));

% aggregate hours
hours_avg = hours_aggregate(data2store(data2use),4,@(x) mean(x,2));
hours_max = hours_aggregate(data2store(data2use),4,@(x) max(x,[],2));
hours_min = hours_aggregate(data2store(data2use),4,@(x) min(x,[],2));


