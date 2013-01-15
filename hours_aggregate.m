function res = hours_aggregate(data,step,f)
    res = [];
    for i=1:step:24
        res = [res agg(data,i,i+step-1,f)];
    end
end

function res = agg(data,start,stop,f)

    res = [];
    while stop<length(data)
        res = [res data(:,start:stop)];
        start = start+24;
        stop = stop+24;
    end
    res = f(res);
    
end