clc
clear all

a=imread('cameraman.tif'); % reading the image
a=im2double(a); % normalizing the instensity values to lie between o and 1

ref=a;
ad=imnoise(a,'salt & pepper',0.05); % adding salt & pepper noise of mean zero and variance 0.05
timestep=0.2; % timestep size used in numerical approximation
Niter=40; % number of iterations 

alpha=2.7; % Used in Numerical approximation
w= exp(4*alpha/9); % Used in Numerical approximation

b = eed(ad, timestep, Niter, 1, 1);

  