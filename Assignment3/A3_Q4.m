img=imread('cameraman.tif');
img=im2double(img);
img = imnoise(img,'salt & pepper',0.05);
x=[1,2,3,4,5];
y=[];
timestep=0.2;
Niter=20;
alpha=2.7; 
w= exp(4*alpha/9);
for i=1:5
    %filtered=imgaussfilt(img,x(i));
    filtered=eed(img, timestep, Niter, 1, x(i));
    %filtered=pmc(img,img,x(i),timestep,Niter,1,w,1); 
    p=psnr(filtered,img);
    y=[y,p];
end

plot(x,y);
xlabel('Smoothing Parameter');
ylabel('Psnr');
title('Psnr vs Smooting Parameter for EED')
