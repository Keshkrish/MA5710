clc
clear all
a=imread('cameraman.tif'); 
a=im2double(a); 

ref=a;
%ad=imnoise(a,'gaussia',0.01);
timestep=0.2; 
Niter=60;  

alpha=2.7; 
w= exp(4*alpha/9); 

b = eed(a, timestep, Niter, 1, 1);
psnr_eed=psnr(b,a);

c=pmc(a,ref,0.001,timestep,Niter,1,w,1); 
psnr_pmc=psnr(c,a);

d=imgaussfilt(ref,1);

imshow(d)
psnr_ld=psnr(d,a);

fprintf('\n The PSNR for EED is %f', psnr_eed );
fprintf('\n The PSNR for PMC is %f', psnr_pmc );
fprintf('\n The PSNR for linear diffusion is %f', psnr_ld );