function res = aggregate_data(values,filter_gen,data,filter_on,aggr)
    
    len = length(values);
    res = [];
    for i=1:len
        filter = filter_gen(values(i,:));
        res = [res aggr(data2store(data(filterData(filter_on,filter),:)))];
    end

end