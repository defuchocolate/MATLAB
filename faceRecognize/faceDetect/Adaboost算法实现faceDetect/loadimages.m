% Author: Scott Sanner
% Email:  ssanner@cs.stanford.edu
% Course: CS223B, Winter
% Desc:   Loads a set of images into an array given
%         a prefix, suffix, and highest index filename.
%
function IM = loadimages(directory, prefix, suffix)

% cd IM this directory
old_dir=pwd;
cd(directory);

% fIMd all matched filenames
dirinfo = dir([prefix,'*.',suffix]);
found = {dirinfo.name};


% Load the image set
for i = 1:size(found,2),
    if suffix=='pgm'
        IM{i} = double(pgmRead(found{i}));
    else
        IM{i} = double(imread(found{i}));
    end
end

res = IM;
size(IM{1})
clear found

% cd out 
cd(old_dir);
