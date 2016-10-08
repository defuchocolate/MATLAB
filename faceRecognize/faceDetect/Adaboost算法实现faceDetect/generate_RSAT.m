%generate_RSAT.m
%2013.11.16
%by: zhou dongao
%Function:
    %Caculate rotate 45 degrees summed area table
%This code is based on the article of Rainer Lienhart's algorithm
%See the pdf:
%http://www.multimedia-computing.de/mediawiki//images/5/52/MRL-TR-May02-revised-Dec02.pdf

%All of the parameters' names are cited from Rainer's article
%Attention: Please read the article first! It's very useful to understand
%this code

function [RSAT] = generate_RSAT( image )
%test
% clear all, close all,clc
% image = double(imread('n01-x.PNG'));
% figure, imshow(image), title('Input image');

%RSAT: rotate 45 degree summed area table, which size equal to image's 
%image: input image
image = double(image);
[H,W] = size(image);%width(W) is column,height(H) is row of the input image

%expand the image's size by comple makeup of 0,
%a row and two column are increased which valued 0
RSAT_ex = double(zeros(H+2, W+2));%initialize expanded RSAT and named RSAT_ex
image_ex = [zeros(1,W); image];
%image_ex = [zeros(H+1,2), image_ex];
for j = 3 : H+2          %from top to bottom
    for i = 2 : W+1      %from left to right
        RSAT_ex(j, i) = RSAT_ex(j-1, i-1) + RSAT_ex(j-1, i+1)...
            -RSAT_ex(j-2, i) + image_ex(j-2, i-1) + image_ex(j-1, i-1);%see algorthm of Rainer
    end
end


% for j = 3 : H+1
%     for i = 2 : W+1
%         RSAT_ex(i, j) = RSAT_ex(i-1, j-1) + RSAT_ex(i+1, j-1)...
%             -RSAT_ex(i, j-2) + image_ex(i, j-1) + image_ex(i, j);
%     end
% end

RSAT = RSAT_ex(3:H+2, 2:W+1);%excluding zeros to make it's size equal to image's

