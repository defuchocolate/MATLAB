%test.m
%test function generate_RSAT() and RRecSum()
%gennerate_RSAT generates a Rotate Summed Area Table of image
%RRecSum() caculates Sum of pixels in the Rotate Rectangle 
%All of these code are based on Rainer's article
%see the pdf:
%http://www.multimedia-computing.de/mediawiki//images/5/52/MRL-TR-May02-revised-Dec02.pdf
%Attentio: Read the article first! It's useful to understand these code.

clc; clear all
close all
image = imread('face1.bmp');%input image
image = rgb2gray(image);

RSAT = generate_RSAT(image);
[H, W] = size(image);
rrec_sum = RRecSum(H, W, 2, 2, 45, RSAT);%test point(7,5) which h=2, w =2, theta = 45
rrec_sum1 = RRecSum(H, W, 1, 1, 45, RSAT);%test point(1,1), h=w=1
rrec_sum2 = RRecSum(H, W, 2, 3, 45, RSAT);%test point(H,W), h=2, w=3