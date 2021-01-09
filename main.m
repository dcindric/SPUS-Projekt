%String represents location of source images to be processed
imageFolder = 'C:\Users';

%Image loading and resizing 
imagePrepared = prepareImages(imageFolder);

%Output images are ready for further processing (segmentation, object
%counting, etc...
imageEnhanced = enhanceImage(imagePrepared);


GMMImages = GMM(imageEnhanced);
segmentedImages = Kmeans(GMMImages);
[numOfOlives, markedImages] = countObjects(segmentedImages);

