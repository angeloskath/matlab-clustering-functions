
data_mod = zeros(49, (383-24)*24);

for i=1:49
    for j=1:383-24
        data_mod(i,(j-1)*24+1:j*24) = temp((j-1)*49+i,:);
    end
end
