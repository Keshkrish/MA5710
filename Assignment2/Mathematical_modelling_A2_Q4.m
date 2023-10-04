football = imread("football.jpg");
football_noise = imnoise(football,'salt & pepper',0.1);
x=1.0+19.0*rand(1,100); %generate random data for smoothing parameter
y=[]; %store true psnr value
for i=1:100
    filtered_image=imgaussfilt(football_noise,x(i));
    p=psnr(filtered_image,football_noise);
    y=[y,p];
end
degree = 2; %polynomial of degree 2 is used for fitting
coefficients = polyfit(x(1:80), y(1:80), degree)% Generate a polynomial using the coefficients
predicted_y = polyval(coefficients, x);
mean_abs_error=mean(abs(predicted_y(81:100)-y(81:100)))
% Plot the original data and the fitted curve
plot(x(81:100), y(81:100), 'go', x(81:100), predicted_y(81:100), 'ro');
xlabel('smoothing parameter');
ylabel('PSNR');
legend('True PSNR', 'Predicted PSNR');
title('True PSNR vs Predicted PSNR for various values of smoothing parameter');
