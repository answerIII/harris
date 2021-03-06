function result = filterGaussian(im, sigma, wind)
% filterGaussian is the finction of Gaus
 

    r2 = (wind-1)/2; 
    c2 = (wind-1)/2;
    
    [x,y] = meshgrid(-c2:c2, -r2:r2);
	radsqrd = x.^2 + y.^2;
	filter = exp(-radsqrd/(2*sigma^2));
	filter = filter/sum(filter(:));
    

    result = conv2 (im, filter, 'same');

end