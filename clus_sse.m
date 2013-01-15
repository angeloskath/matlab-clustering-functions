function [c sse] = clus_sse(idx,data)

    c = zeros(max(idx), size(data,2));
    sse = zeros(max(idx),1);
    
    for i=1:size(c,1)
        c(i,:) = mean(data(idx==i,:),1);
    end
    
    for i=1:length(c)
          temp = data(idx==i,:);
          for j=1:size(temp,1)
              sse(i) = sse(i) + sum((c(i,:)-temp(j,:)).^2);
          end
    end
    
end

