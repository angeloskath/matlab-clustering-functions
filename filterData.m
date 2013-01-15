function A = filterData( data, f )
%FILTERDATA Summary of this function goes here
%   Detailed explanation goes here

A = zeros(length(data),1);
for i=1:length(data)
    if (f(data(i,:),i))
        A(i,:)=1;
    end
end
A = A>0;

end

