function [featureX, featureY, R] = cornerHarris(im, wind, sigma, threshold, k)
% cornerHarris is the Harris

    % проверка на то, что ядро с нечетной размерностью
    if ~mod(wind, 2)
        wind = wind + 1;
    end

    % переводим изображение в серое
    dim = ndims(im);
    if( dim == 3 )
	I = rgb2gray(im);
    else
	I = im;
    end
    

    % переводим изображение в double
	I = double(I);
    

    % Удаляем шум из изображения
    sI = filterGaussian(I, sigma, wind);

    
    % Берем производные изображения по Х и по У
    [Ix, Iy] = gradient(sI);
   

    %derivative_X = [1, 2, 1, 0, 0, 0, -1, -2, -1]; 
    %derivative_Y = [-1, 0, 1, -2, 0, 2, -1, 0, 1];  
    %Ix = conv2(I, derivative_X);
    %Iy = conv2(I, derivative_Y);
    
    %Ix = Ix .^ 2;
    %Iy = Iy .^ 2;

    % Элементы искомой матрицы М
    Ix2 = Ix .^ 2;
    Iy2 = Iy .^ 2;
    Ixy = Ix .* Iy;
    
    
    % Сглаживаем элементы матрицы
    Sx2 = filterGaussian(Ix2, sigma, wind);
    Sy2 = filterGaussian(Iy2, sigma, wind);    
    Sxy = filterGaussian(Ixy, sigma, wind);    

    
    % Вычисляем функцию отклика угла
    R = (Sx2 .* Sy2 - Sxy .^ 2) - k * (Sx2 + Sy2) .^ 2;

    
    % Отсекам по порогу те значения, которые ниже
    R2 = (R > threshold);

    % Находим точки, которые посчитались, как угловые
    temp = imdilate(R, [1 1 1; 1 0 1; 1 1 1]);
    R2 = R2 & (R > temp);
    

    
    [featureX, featureY] = find(R2);
end