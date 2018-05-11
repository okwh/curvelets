function [] = pmAutoThresh(ff,OutputFolder)
%Define pmAutoThresh() function that will automatically threshold and
%image file with the method of users choice
%Steps-
%   1. Setup variables
%   2. Read in image data
%   3. Apply automatic thresholding method set by option flags
%   4. Write thresholded data to mask file
%
%Input:
%Full file path to image file to threshold
%Default input
% ff = 'fullfile(filePath,fileName,fileExtension)'
% OutputFolder = Path to output folder
% Options flags for thresholding method selection
%
%Output:
% Threshholded image mask? file(s) and/or
% Warning messages
%
%Log:
%   1. January 2018 to May 2018: Andrew S. Leicht student at UW-Madison was
%   tasked with this project, under the supervision of Yuming Liu at LOCI.
%   Development was done with Matlab R2014b (8.4.0.150421) under
%   Academic license on Ubuntu 17.10.
%   ~6 Man hours of work, coding and testing. 5/1/18
%
% Licensed under the 2-Clause BSD license
% Copyright (c) 2009 - 2018, Board of Regents of the University of Wisconsin-Madison
% All rights reserved.
%
%
%1. Setup Variables
[filePath,fileName,fileExtension] = fileparts(ff); % Parse path/file details
info = imfinfo(ff); % store tif meta-data tags
numSections = numel(info); % # of images in stack
outputFileName = [fileName '_Mask' fileExtension]; % setup output filename
outputFullPath = fullfile(OutputFolder,outputFileName); % setup full output path
ThreshMethFlag = 4;%set flag to select threshold method
% (1) Global Otsu Method; (2) Local Otsu Method;
% (3) Kittler-Illingworth Cluster Method;
% (4) Ridler-Calvard (ISO-data) Cluster Method; (5) Kapur Entropy Method;
% (6) Local Sauvola Method; (7)Local Adaptive Method

%Internal Functions (Methods) to simplfy code
    function [thresh,I] = AthreshInternal(ImgOri) %function to threshold an image with many options
        switch ThreshMethFlag
            case 1 %3. Use Global Otsu Method to threshold images
                [thresh,EM] = graythresh(ImgOri);
                I = im2bw(ImgOri,thresh);%output as binary mask
                if numSections > 1
                    fprintf('Automatic Image Thresholding done with a %f Effectiveness Metric for slice %u.\n',EM,S)
                else
                    fprintf('Automatic Image Thresholding done with %f Effectiveness Metric.\n',EM)
                end
                drawnow
            case 2 %3. Use Local Otsu Method to threshold image
            case 3 %3. Use Kittler-Illingworth Cluster threshold method
            case 4 %3. Use Ridler-Calvard (ISO-data) Cluster threshold method
                vImgOri = ImgOri(:); % vectorize image matrix
                [PixCt,PixInt] = imhist(vImgOri); % histogram of image
                %setup formula for iterated threshold
                T(1) = round(sum(PixCt .* PixInt) ./ sum(PixCt));
                Change = 1;
                i=1;	%counter of iterations of ThreshItr
                while (Change ~= 0) && (i<15)
                    T_indexes = find(PixInt >= T(i)); % sort Pixel Intensity bins
                    T_i = T_indexes(1);	% finds the value (in "intensity") that is closest to the threshold.
                    % calculate mean below current threshold: MBT
                    MBT = sum(PixCt(1:T_i) .* PixInt(1:T_i) ) ./ sum(PixCt(1:T_i));
                    % calculate mean above current threshold: MAT
                    MAT = sum(PixCt(T_i:end) .* PixInt(T_i:end) ) ./ sum(PixCt(T_i:end));
                    % Iterate new threshold as mean of MAT and MBT
                    i= i+1;
                    T(i) = round((MBT + MAT) ./ 2);
                    Change = T(i) - T(i-1);
                end
                threshi = T(i);
                % Normalize threshold to interval [0,1]
                thresh = (threshi - 1) / (PixInt(end) - 1); 
                I = im2bw(ImgOri,thresh);%output as binary mask
            case 5 %3. Use Kapur Entropy threshold method
            case 6 %3. Use Local Sauvola threshold method
            case 7 %3. Use Local Adaptive threshold method
                
        end
    end
%If threshold mask file already exists delete it before proceeding
if exist(outputFullPath,'file') == 2
    delete(outputFullPath);
end
%Do operations on stack or single image
if numSections > 1  %For case of multi-image stack
    for S = 1:numSections
        ImgOri = imread(ff,S,'Info',info);%2. read in image slicewise
        [thresh,I] = AthreshInternal(ImgOri);
        fprintf('Threshold value found to be %f for slice %u.\n',thresh,S)
        imwrite(I, outputFullPath, 'WriteMode', 'append', 'Compression','none');%4. write slice to file
    end
else %for case when tif is single image
    ImgOri = imread(ff);%2. read in image
    [thresh,I] = AthreshInternal(ImgOri);
    fprintf('Threshold value found to be %f.\n',thresh)
    imwrite(I, outputFullPath, 'WriteMode', 'overwrite', 'Compression','none');%4. write to file
end
return;
end