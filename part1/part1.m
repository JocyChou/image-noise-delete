clear
clc
mtx = zeros(512,512);                % Create a 512*512 image and calculate the values in each pixels
for i = 1 : 512
    for j = 1 : 512
        mtx(i,j) = sin(0.1 * i) + sin(0.2 * i) + cos(0.4 * i) + sin(sqrt(i.^2 + j.^2) * 0.15) + sin(sqrt(i.^2 + j.^2) * 0.35);
    end
end
figure, imshow(mtx);
title('Original image');


dft = fft2(mtx);                               % Compute DFT of the image created
sdft = fftshift(dft);

mag = abs(sdft);                               % Magnitude
mag1 = mat2gray(log(mag+1));                           % Use mat2gray and log to scale the image between 0 and 1
figure, imshow(mag1);

mag2 = mag/500;
figure, imshow(mag2);

phase = angle(sdft)/2;                   % Phase
figure, imshow(phase);

mag2 = mag * 2;
mag2 = ifft2(ifftshift(mag2));
figure, imshow(mag2);
%close all;

mag2 = mag2 * 2;
mag2 = ifft2(ifftshift(mag2));
figure, imshow(mag2);

