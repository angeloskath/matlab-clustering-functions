function im = heatmap(idx, data)

    Y = pdist(data); 
    dist = squareform(Y);
    sim = exp(-dist);
    len = size(data,1);
    temp = zeros(len);
    
    order = [];
    for i=1:max(idx)
        order = [order indexes(idx==i)];
    end
    for i=1:len
        for j=1:len
            temp(i,j) = sim(order(i),order(j));
        end
    end
    
    %u = @(x) heaviside(x);
    im = zeros(len,len,3);
    for i=1:len
        for j=1:len
            t = temp(i,j);
            %im(i,j,:) = [(3*t-1).*(u(t-1/3)-u(t-2/3))+(u(t-2/3)-u(t-1)) , ((3*t).*(u(t)-u(t-1/3)))+(u(t-1/3)-u(t-2/3))+(3-3*t).*(u(t-2/3)-u(t-1)) , (2-3*t).*(u(t-1/3)-u(t-2/3))+(u(t)-u(t-1/3))];
            im(i,j,:) = [trapmf(t, [1/3 2/3 1 1]) trapmf(t, [0 1/3 2/3 1]) trapmf(t, [0 0 1/3 2/3])];
        end
    end
    
end

function i = indexes(A)
    i = [];
    for j=1:length(A)
        if (A(j))
            i = [i j];
        end
    end
end