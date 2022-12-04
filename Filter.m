% ROBT 310 - Lecture 11 Matlab Codes
%
% Author: Zhanat (modified from Atakan )
% Date: 2021

%%
close all ; clc; clear;     % Close all figure windows, Clear the screen and the workspace memory

%% Examples of image enhancement by smoothing, masking, adding
%% Step 1 - Read the original image
I = im2double(imread('colored.jpg'));

figure(1); imshow(I); title('colored image from event based camera'); 
%% Step 2 - Smooth Filtering 
h_smooth = ones(5,5)/25;
I_smooth = convn(I, h_smooth, 'same');    
figure(2); imshow(I_smooth); title('Sobel 5x5 Smoothed');
%% Step 3 - Mask
I_masking = I - I_smooth;  
figure(3); imshow(I_masking,[]); title('Mask'); 
%% Step 4 - Enhanced image 
I_enhanced = I + I_masking;  
figure(4); imshow(I_enhanced); title('Enhanced'); 




%% Examples of image enhancements:
%% Step 1 - Read the original image
I = im2double(imread('colored.jpg'));
II = (imread('grayscale.jpg'));

figure(1); imshow(I); title('original image'); 
%% Step 2 - Laplacian Filtering 
% Prepare laplacian filter
%h_laplacian = [-1 -1 -1; -1 8 -1; -1 -1 -1]; 
h_laplacian = [-1 -1 -1; -1 8 -1; -1 -1 -1]; 
I_lap = convn(I, h_laplacian, 'same');  % Laplacian Filtering 
% Normalize Laplacian of the image for display purposes
% or you can use built in Matlab imshow() function in the following form imshow(I_lap, [])
I_lap_norm = (I_lap - min(I_lap(:))) ./ max(I_lap(:) - min(I_lap(:))); 
figure(2); imshow(I_lap_norm); title('Laplacian Image'); 

%% Step 3 - % Image Sharpening
I_sharp = I + I_lap;    
figure(3); imshow(I_sharp); title('Enhanced Laplacian Image'); 

%% Step 4 -  Pronounce the Edges of the Original Image
h_sob_ver = [-1 -2 -1; 0 0 0; 1 2 1]; 
h_sob_hor = [-1 0 1; -2 0 2; -1 0 1]; 

I_sobel = abs(convn(I, h_sob_ver, 'same')) + abs(convn(I, h_sob_hor, 'same')); 
figure(4); imshow(I_sobel); title('Sobel Image'); 

%% Step 5 - Smooth the Image using Averaging Filter

h_smooth = ones(5,5)/25;
I_smooth = convn(I_sobel, h_smooth, 'same');   
figure(5); imshow(I_smooth); title('Sobel 5x5 Smoothed'); 

%% Step 6 - Create a Mask using Sobel and Sharp
I_mask = I_sharp.*I_sobel;            
figure(6); imshow(I_mask); title('Mask Image'); 

%% Step 7 - Sharpen the Image again using the Mask
I_sharp2 = I + I_mask;   
figure(7); imshow(I_sharp2); title('Sharpened Image'); 

%% Step 8 - Apply Power Law to Enhance Image Contrast
I_pow = I_sharp2.^0.7; % Apply power law to enhance contrast
figure(8); imshow(I_pow); title('Power-law Image'); 




