clc
clear all

timestep=0.2;
Niter=20; 

alpha=2.7; 
w= exp(4*alpha/9);

% CAMERAMAN IMAGE
x=imread('cameraman.tif'); 

x=im2double(x);

ref=x;
noise=['gaussian','salt & pepper','speckle'];
var=[0.05,0.1,0.15,0.2,0.25];


fprintf('\n PSNR values for gaussian for cameraman image');
for j=1:5
    a=imnoise(x,'gaussian',var(j));
    %ya = eed(a1, timestep, Niter, 1, 1);
    %ya=pmc(a1,ref,0.001,timestep,Niter,1,w,1);
    ya=imgaussfilt(a,1);
    psnra=psnr(ya,a);
    fprintf('\n The PSNR for var=%f is %f', var(j),psnra );
end

fprintf('\n PSNR values for salt & pepper for cameraman image');
for j=1:5
    a=imnoise(x,'salt & pepper',var(j));
    %ya = eed(a1, timestep, Niter, 1, 1);
    %ya=pmc(a1,ref,0.001,timestep,Niter,1,w,1);
    ya=imgaussfilt(a,1);
    psnra=psnr(ya,a);
    fprintf('\n The PSNR for var=%f is %f', var(j),psnra );
end
        
fprintf('\n PSNR values for speckle for cameraman image');
for j=1:5
    a=imnoise(x,'speckle',var(j));
    %ya = eed(a1, timestep, Niter, 1, 1);
    %ya=pmc(a1,ref,0.001,timestep,Niter,1,w,1);
    ya=imgaussfilt(a,1);
    psnra=psnr(ya,a);
    fprintf('\n The PSNR for var=%f is %f', var(j),psnra );
end

a=imnoise(x,'poisson');
%ya = eed(a1, timestep, Niter, 1, 1);
%ya=pmc(a1,ref,0.001,timestep,Niter,1,w,1);
ya=imgaussfilt(a,1);
psnra=psnr(ya,a);
fprintf('\n The PSNR value for poisson noise is: %f',psnra);


  