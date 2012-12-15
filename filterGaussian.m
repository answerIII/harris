function result = filterGaussian(im, sigma, wind)
% filterGaussian is the finction of Gaus
 
    if ~mod(wind, 2)
        wind = wind + 1;
    end
    
    filter = fspecial('gaussian', [wind wind], sigma);
    result = filter2(filter, im);
end