function matrix = SS(level)
if level == 1
    matrix = rand(5,5) > .9;
elseif level == 2
    matrix = rand(5,5) > .8;
elseif level == 3
    matrix = rand(5,5) > .7;
elseif level == 4
    matrix = rand(5,5) > .2;
end
   spaceship.speed = 1;
   spaceship.x = 4;
   spaceship.y = 4;
   spaceship.dir = 2;

   matrix = double(matrix);
   [ydim, xdim] = size(matrix);
   ringedMat = ones(ydim+2,xdim+2);
   ringedMat(2:ydim+1,2:xdim+1) = matrix;
   matrix = ringedMat;
   

