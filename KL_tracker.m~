Im1 = imread('card2.jpg');

Im1 = imresize(Im1, 0.3);


[featureX, featureY, R] = cornerHarris(Im1, 20, 1, 50, 0.04);


[width, height] = size(featureX);
Im2 = zeros(size(Im1));

for i=1:1:width
    Im2(featureX(i,1), featureY(i,1)) = 255;
    
    
    Im1(featureX(i,1)-1, featureY(i,1)-1) = 256;
    Im1(featureX(i,1), featureY(i,1)-1) = 256;
    Im1(featureX(i,1)+1, featureY(i,1)-1) = 256;
    
    Im1(featureX(i,1)-1, featureY(i,1)) = 256;
    Im1(featureX(i,1), featureY(i,1)) = 256;
    Im1(featureX(i,1)+1, featureY(i,1)) = 256;
    
    Im1(featureX(i,1)-1, featureY(i,1)+1) = 256;
    Im1(featureX(i,1), featureY(i,1)+1) = 256;
    Im1(featureX(i,1)+1, featureY(i,1)+1) = 256;
    
    Im1(featureX(i,1), featureY(i,1)) = 255;
end

subplot(1,3,1);
subimage(uint8(Im1));
subplot(1,3,2);
subimage(Im2);
subplot(1,3,3);
subimage(R);
