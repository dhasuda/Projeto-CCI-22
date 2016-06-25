anterior = int2str(0);
stri = 'oito0.png';
X = zeros(250, 400);
for i=1:25
   number = int2str(i);
   stri = strrep(stri, anterior, number);
   anterior = number;
   img = imread(stri);
   img = rgb2gray(img);
   img = reshape(img', [1, 400]);
   X(i+200,:) = img;
end




anterior = int2str(0);
stri = 'quatro0.png';
X = zeros(250, 400);
for i=1:25
   number = int2str(i);
   stri = strrep(stri, anterior, number);
   anterior = number;
   img = imread(stri);
   img = rgb2gray(img);
   size(img)
end


for i=1:25
   y(i+25) = 1; 
end



