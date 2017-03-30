img = imread('noisyImage.jpg');
fimg = fft2(img);
mag = abs(fimg);
pha = angle(fimg);
imgmag = fftshift(mag)/100000;
figure, imshow(imgmag);

mask = ones(512,512);           % mask1
down = 80;
up = 110;  %500
for i = 1:512
    for j = 1:512
        test = (i - 256) * (i - 256) + (j - 256) * (j - 256);
        if((test > down * down) && (test < up * up))
            mask(i,j) = 0;
        elseif ((i > 250) && (i < 260) && (j > 0) && (j < 150))
            mask(i,j) = 0;
        elseif ((i > 250) && (i < 260) && (j > 360) && (j < 512))
            mask(i,j) = 0;
        elseif ((j > 250) && (j < 260) && (i > 0) && (i < 150))
            mask(i,j) = 0;
        elseif ((j > 250) && (j < 260) && (i > 360) && (i < 512))
            mask(i,j) = 0;
            
        elseif ((j > 180) && (j < 190) && (i > 0) && (i < 180))
            mask(i,j) = 0;
        elseif ((j > 180) && (j < 190) && (i > 320) && (i < 512))
            mask(i,j) = 0;
        elseif ((j > 325) && (j < 335) && (i > 0) && (i < 180))
            mask(i,j) = 0;
        elseif ((j > 325) && (j < 335) && (i > 320) && (i < 512))
            mask(i,j) = 0;    
        
        elseif ((i > 180) && (i < 190) && (j > 0) && (j < 180))
            mask(i,j) = 0;
        elseif ((i > 180) && (i < 190) && (j > 320) && (j < 512))
            mask(i,j) = 0;
        elseif ((i > 325) && (i < 335) && (j > 0) && (j < 180))
            mask(i,j) = 0;
        elseif ((i > 325) && (i < 335) && (j > 320) && (j < 512))
            mask(i,j) = 0;  
            
        elseif ((j > 254) && (j < 258) && (i > 170) && (i < 235))
            mask(i,j) = 0;  
        elseif ((j > 254) && (j < 258) && (i > 276) && (i < 366))
            mask(i,j) = 0; 
        
        elseif ((i > 254) && (i < 258) && (j > 170) && (j < 235))
            mask(i,j) = 0;  
        elseif ((i > 254) && (i < 258) && (j > 276) && (j < 366))
            mask(i,j) = 0; 
        
        end
    end
end


% reconstruct picture
mag2 = fftshift(mag);
mag2 = mask .* mag2;
imgmag2 = (mag2)/100000;
figure, imshow(imgmag2);

mag2 = ifftshift(mag2);
re = mag2 .* cos(pha);
im = mag2 .* sin(pha);
reconstruct = ifft2(re + 1i*im);
reconstruct = uint8(reconstruct);

figure, imshow(reconstruct);




