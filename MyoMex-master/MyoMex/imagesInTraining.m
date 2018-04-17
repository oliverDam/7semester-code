function imagesInTraining(im1, im2, im3, im4, im5, im6, im7)

imageExte = imread('url.jpg');
imageFlex = imread('url2.png');
imageRadi = imread('url3.jpg');
imageUlna = imread('url4.png');
imageFist = imread('url5.jpg');
imageStre = imread('url6.jpg');
imageRest = imread('url7.jpg');

axes(im1)
image(imageExte);
axis off;
axis image; drawnow;

axes(im2)
image(imageFlex);
axis off;
axis image; drawnow;

axes(im3)
image(imageRadi);
axis off;
axis image; drawnow;
        
axes(im4)
image(imageUlna);
axis off;
axis image; drawnow;

axes(im5)
image(imageFist);
axis off;
axis image; drawnow;

axes(im6)
image(imageStre);
axis off;
axis image; drawnow;
        
axes(im7)
image(imageRest);
axis off;
axis image; drawnow;