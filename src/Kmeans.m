function  segmentedImages = Kmeans(GMMImages)

%Reserve memory space for segmented images 
segmentedImages = cell(numel(GMMImages));

%Define folder destination for segmented images
foldername = 'C:\Users\Dino\Documents\SPUS-Projekt\Segmented Images';


for i = 1:numel(GMMImages)
    
    %Image segmentation usign k-means clustering method 
    L = imsegkmeans(GMMImages{i}, 2);
    segmentedImages{i} = rgb2gray(labeloverlay(GMMImages{i}, L));
    gray_treshold = graythresh(segmentedImages{i});
    segmentedImages{i} = imbinarize(segmentedImages{i}, gray_treshold);
    
    %Write segmented images to disk
    filename = fullfile(foldername, sprintf('SEG_%d.png', i));
    imwrite(segmentedImages{i}, filename);
    

end 


segmentedImages = transpose(segmentedImages(:, 1));

end