%Image filtering testing ground 

sig01 = imread("SIG_01.png");
figure
imshow(sig03)

sig04 = imresize(sig03, [350, 500]);

figure
imshow(sig04)