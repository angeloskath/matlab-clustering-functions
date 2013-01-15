function res = data2store(data, rows, cols)

    if nargin == 1
        rows = 49;
        cols = 24;
    elseif nargin == 2
        cols = 24;
    end

    len = length(data)/rows;
    res = zeros(rows, len*cols);

    for i=1:rows
        for j=1:len
            res(i,(j-1)*cols+1:j*cols) = data((j-1)*rows+i,:);
        end
    end
end