PSF  = fspecial('disk',6);% pre-defined 2D filter of specified type, default radius is 5
% returns a circular averaging filter (pillbox) within the square matrix of size 2*radius+1. 
% The default radius is 5.
OTF_1  = psf2otf(PSF,[36,36]); % PSF --> OTF
subplot(1,2,1); surf(PSF); title('PSF');
axis square; axis tight;
xlim([-2,14]);ylim([-2,14]);zlim([0 0.009]);
subplot(1,2,2); surf(abs(OTF_1)); title('Corresponding |OTF|');
axis square; axis tight;