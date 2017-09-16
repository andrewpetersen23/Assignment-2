clear all; close all; clc;

% pos1 = imread('balls/img001.jpg');

StartingFrame = 1;
EndingFrame = 489;

Xcentroid = [];
Ycentroid = [];

for k = StartingFrame : EndingFrame-1
    rgb = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);
    [BW, rbg1] = createMask(rgb);
    [labels, number] = bwlabel(BW,8);
    if number > 0
        Istats = regionprops(labels,'basic','Centriod');
        [values,index] = sort([Istats.Area],'descend');
        [maxVal, maxIndex] = max([Istats.Area]);
        Istats(maxIndex).Centroid;
        Istats(maxIndex).Centroid(1);
        Istats(maxIndex).Centroid(2);
        Xcentroid = [Xcentroid Istats(maxIndex).Centroid(1)];
        Ycentroid = [Ycentroid Istats(maxIndex).Centroid(2)];
    end
end

Xcentroid2 = [];
Ycentroid2 = [];

for k = StartingFrame : EndingFrame-1
    rgb2 = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);
    [BW, rbg1] = createMask2(rgb2);
    [labels, number] = bwlabel(BW,8);
    if number > 0
        Istats = regionprops(labels,'basic','Centriod');
        [values,index] = sort([Istats.Area],'descend');
        [maxVal, maxIndex] = max([Istats.Area]);
        Istats(maxIndex).Centroid;
        Istats(maxIndex).Centroid(1);
        Istats(maxIndex).Centroid(2);
        Xcentroid2 = [Xcentroid2 Istats(maxIndex).Centroid(1)];
        Ycentroid2 = [Ycentroid2 Istats(maxIndex).Centroid(2)];
    end
end

imshow('img001.jpg')
hold on
scatter(Xcentroid,Ycentroid, 'b');
scatter(Xcentroid2,Ycentroid2, 'g');