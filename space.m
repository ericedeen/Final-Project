function [row,col] = space(matrix,dir,speed)
%x is the length of the array up and down
%y is the length of the array side to side
%col is the orig x position of the 2
%row is the orig y pos of the 2
if speed == 1
    a = 1;
elseif speed == 2
    a = .75;
elseif speed  == 3 %sets speed the function will run at 
    a = .5;
else 
    a = .25;
end

[y,x] = size(matrix);

if mod(x,2) == 0 
    evenx = x/2;
else 
    oddx = (x+1)/2; %even or odd x length
end 

if mod(y,2) == 0
    eveny = y/2;
else                    %even or odd y length
    oddy = (y+1)/2;
end 

if mod(x,2) == 0 && mod(y,2) == 0
    matrix(eveny,evenx+1) = 2;
    row = eveny;
    col = evenx+1;
elseif mod(x,2) == 1 && mod(y,2) == 0 %initial placement of the ship
    matrix(eveny,oddx) = 2;
    row = eveny;
    col = oddx;
elseif mod(x,2) == 0 && mod(y,2) == 1
    matrix(oddy,evenx) = 2;
    row = oddy;
    col = evenx;
else
    matrix(oddy,oddx) = 2;
    row = oddy;
    col = evenx;
end 

matrix = matrix %shows the original matrix

pause(a) %pause for a set speed


onechecker = 1; %for while loop

if dir == 1 %up
    for b = row:-1:1
        while onechecker == 1
            if matrix(b-1,col) == 0
                    matrix(b-1,col) = 2;
                    matrix(b,col) = 0;
                    onechecker = 1;
                    matrix = matrix
                    disp('speed =')  %all testing here
                    disp(a)
                    disp('North')
                    pause(a)
                    
            else
                    matrix = zeros(y,x);
                    matrix = matrix
                    onechecker = 0;
                    %pause(a)
            end 
                %pause(a)
                %matrix = matrix
                disp('Game over')
        end 
    end 
elseif dir == 2 %right
    for c = col:x
        if matrix(row, c+1) == 0
            matrix(row,c+1) = 2;
            matrix(row,c) = 0;
        else
            matrix = zeros(y,x);
        end 
        pause(a)
        matrix = matrix
    end 
elseif dir == 3 %down
    for d = row:y
        if matrix(d+1,col) ~= 1
            matrix(d+1,col) = 2;
            matrix(d,col) = 0;
        else
            matrix = zeros(y,x);
        end 
        pause(a)
        matrix = matrix
    end 
else %left
    for e = col:-1:1
        if matrix(row, e-1) == 0
            matrix(row,e-1) = 2;
            matrix(row,e) = 0;
        else
            matrix = zeros(y,x);
        end 
        pause(a)
        matrix = matrix
    end 
end
%need to know when its at the edge of a matrix-> solved by a while loop as 
%seen in dir 1
%number one can accomplish that
%perhaps make it so that when it notices a 1 is in its way go to the it can
%switch direction, maybe we can do that by calling another function.
%for making a gui, i think we will be able to use parts of this in the push
%button areas
