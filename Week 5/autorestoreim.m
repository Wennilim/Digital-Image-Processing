function [outputArg1] = autorestoreim(image)
%clear all, close all, clc
J=imread(image);
varJ=var(single(J(:)));
estnd=1.98329104609426e-09*varJ^2+3.49633434902157e-05*varJ-0.104829716174672;
subplot(2,1,1);imshow(J),title(['Image var=',num2str(varJ),';  Est.nd=',num2str(estnd)])

if (varJ<7000)
    s=3;
elseif (varJ<10000)
    s=5;
elseif (varJ<15000)
    s=7;
end
L = medfilt2(J,[s s]);% restore image
subplot(2,1,2);imshow(L),title(['Median filter size = ',num2str(s)])

end