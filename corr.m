function c = corr(idx, data)
    
    cl = max(idx);
    temp = zeros(cl, 1);
    
    for i=1:cl
        tmp = corrcov(cov(data(idx==i,:)))
        temp(i) = mean(mean(abs(tmp)));
    end
    
    c = mean(temp);
    
end