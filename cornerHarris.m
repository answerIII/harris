function [featureX, featureY, R] = cornerHarris(im, wind, sigma, threshold, k)
% cornerHarris is the Harris

    % �������� �� ��, ��� ���� � �������� ������������
    if ~mod(wind, 2)
        wind = wind + 1;
    end

    % ��������� ����������� � �����
    dim = ndims(im);
    if( dim == 3 )
	I = rgb2gray(im);
    else
	I = im;
    end
    

    % ��������� ����������� � double
	I = double(I);
    

    % ������� ��� �� �����������
    sI = filterGaussian(I, sigma, wind);

    
    % ����� ����������� ����������� �� � � �� �
    [Ix, Iy] = gradient(sI);
   

    %derivative_X = [1, 2, 1, 0, 0, 0, -1, -2, -1]; 
    %derivative_Y = [-1, 0, 1, -2, 0, 2, -1, 0, 1];  
    %Ix = conv2(I, derivative_X);
    %Iy = conv2(I, derivative_Y);
    
    %Ix = Ix .^ 2;
    %Iy = Iy .^ 2;

    % �������� ������� ������� �
    Ix2 = Ix .^ 2;
    Iy2 = Iy .^ 2;
    Ixy = Ix .* Iy;
    
    
    % ���������� �������� �������
    Sx2 = filterGaussian(Ix2, sigma, wind);
    Sy2 = filterGaussian(Iy2, sigma, wind);    
    Sxy = filterGaussian(Ixy, sigma, wind);    

    
    % ��������� ������� ������� ����
    R = (Sx2 .* Sy2 - Sxy .^ 2) - k * (Sx2 + Sy2) .^ 2;

    
    % ������� �� ������ �� ��������, ������� ����
    R2 = (R > threshold);

    % ������� �����, ������� �����������, ��� �������
    temp = imdilate(R, [1 1 1; 1 0 1; 1 1 1]);
    R2 = R2 & (R > temp);
    

    
    [featureX, featureY] = find(R2);
end