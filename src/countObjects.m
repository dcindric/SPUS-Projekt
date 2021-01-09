function [numOfOlives, markedImages] = countObjects(segmentedImages)
   
    %Reserve memory space for marked images 
    markedImages = segmentedImages;
    
    %Define folder destination for marked images 
    foldername = 'C:\Users\Dino\Documents\SPUS-Projekt\Final Output';
    
    %Number of olive trees counted, index in vector array corresponds to
    %number of olive trees counted on indexed image, for example:
    %numOfOlives(4) = 200 => on 4th image there is 200 olive trees 
    numOfOlives = zeros(1, numel(segmentedImages));
    
    
    for i = 1: numel(segmentedImages)
        
        figure
        
        imshow(markedImages{i})
        %d = imdistline();
          
        [centers, radii, metric] = imfindcircles(segmentedImages{i},[4 30],'ObjectPolarity','dark','Sensitivity',0.9); 
        
        hold on;
        
        
        viscircles(centers, radii,'EdgeColor','b');
  
        numOfOlives(i) = length(metric);
        
        title(['No. of trees:  ' num2str(numOfOlives(i))]);
        
        filename = fullfile(foldername, sprintf('FINAL_%d.png', i));
        
        print(filename, '-dpng')
        %imwrite(markedImages{i}, filename);

    end


end
