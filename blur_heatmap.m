function H = blur_heatmap(I,grow,blur_size,stdv)
	if nargin<4
		stdv = 1;
	end
	if nargin<3
		blur_size = 5;
	end
	if nargin<2
		grow = 3;
	end
	G = fspecial('gaussian',[blur_size blur_size],stdv);
	H = imresize(I,grow);
	H = imfilter(H,G,'same');
    z = zeros(size(H,1),size(H,2),3);
    o = ones(size(H,1),size(H,2),3);
    H = min(max(H,z),o);
end
