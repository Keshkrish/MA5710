%EED
function g = eed(f, stepsize, nosteps, verbose, sigma)
  

if verbose
    figure(verbose);
    subplot(1,2,1);
    imshow(f);
    title('Original Image');
    drawnow;
end
g=f;
[n,m]=size(f);
N=n*m;
for i=1:nosteps
     
    [gx, gy] = gradient(g);  %Calculate the gradient 
    g = imgaussfilt(g, sigma);

    [re, im] = gradient(g);

    glist = re + im*1i;
    gppr_list = glist * 1i; %Calculate perpendicular to glist
    
    J = zeros(n, m, 2);

     for j = 1:n
        for k = 1:m
            gu = [gx(j,k); gy(j,k)];
            
            gus = [real(glist(j,k)); imag(glist(j,k))];
            gusPpr = [real(gppr_list(j,k)); imag(gppr_list(j,k))];
            
            v1 = gus / norm(gus);
            v2 = gusPpr / norm(gus);
            
            lamb1 = C(norm(gus)^2);
            lamb2 = 1;
            
            D = [v1, v2] * diag([lamb1, lamb2]) * [v1'; v2'];
            temp = D * gu;
            J(j,k,1) = temp(1);
            J(j,k,2) = temp(2);
        end
    end
    
    divJ = zeros(n, m);
    
    for j = 1:(n-1)
        for k = 1:(m-1)
            divJ(j,k) = (J(j,k)-J(j,k+1)) + (J(j,k)-J(j+1,k));
        end
    end
    g = g + stepsize * divJ;
    %plot the image
    if verbose
        figure(verbose);
        subplot(1,2,2);
        imshow(g);
        title('EED');
        drawnow;
    end
            
end