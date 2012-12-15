function newIm = myconv(im, wind)
% myconv is the finction of my convolution


    [aIm, bIm] = size(Im);
    [aX, bX] = size(X);


    newIm = zeros( aIm+aX-1, bIm+bX-1 );

    for i = 1:aX
        for j = 1:bX
            r1 = i;
            r2 = r1 + aIm - 1;
            c1 = j;
            c2 = c1 + bIm - 1;
            newIm(r1:r2,c1:c2) = newIm(r1:r2,c1:c2)+X(i,j) * Im;
        end
    end


    r1 = floor(aX/2) + 1;
    r2 = r1 + aIm - 1;
    c1 = floor(bX/2) + 1;
    c2 = c1 + bIm - 1;
    newIm = uint8(newIm(r1:r2, c1:c2));

end