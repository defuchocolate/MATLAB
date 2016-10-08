%RRecSum.m
%2013.11.16
%by: zhou dongao
%Function:
    %Caculate Rotate Rectangle pixels' Sum
%This code is based on the article of Rainer Lienhart's algorithm
%See the pdf:
%http://www.multimedia-computing.de/mediawiki//images/5/52/MRL-TR-May02-revised-Dec02.pdf

%All of the parameters' names are cited from Rainer's article
%Attention: Please read the article first! It's very useful to understand this code.

function rrec_sum = RRecSum(y, x, w, h, theta, rsat)
RSAT = rsat;
[H,W] = size(RSAT);
RSAT_ex = zeros(H+2*h+2*w, W+2*h+2*w);   %expanding the matrix for some boundary cases,
RSAT_ex(h+w+1:H+h+w, h+w+1:W+h+w) = RSAT;%this is just my poor solution, 
                                         %there are some better solution else.
x = x + h+ w;
y = y + h+ w;

rrec_sum = RSAT_ex(y+w+h-1, x-h+w) + RSAT_ex(y-1, x)...
    - RSAT_ex(y+h-1, x-h) - RSAT_ex(y+w-1, x+w);    %see algorithm of Rainer.

