football = imread("football.jpg");
imshow(football)

football_noise = imnoise(football,'salt & pepper',0.1);
imshow(football_noise)

x=[];
y=[];
for i=1:20
    x=[x,i];
    filtered_image=imgaussfilt(football_noise,i);
    p=psnr(filtered_image,football_noise);
    y=[y,p];
    fprintf('The PSNR for filtered image with sigma %d is %f \n',i,p);
end

plot(x,y,'r-*');
xlabel('smoothing parameter');
ylabel('PSNR');
title('PSNR vs Smoothing parameter');
grid on;
