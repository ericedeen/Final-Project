function Graph(matrix,dir,row,colum) 
   
   Flip = rot90(matrix);
   Flip = rot90(Flip);
   Flip = rot90(Flip);
   Flip(row,colum) = dir;

   
    [row1,col1] = find(Flip==1); % finds all asteroids
    [row2,col2] = find(Flip==2); % finds all left
    [row3,col3] = find(Flip==3); %
    [row4,col4] = find(Flip==4);
    [row5,col5] = find(Flip==5);
    

scatter(row1,col1,'o','filled','b')
hold all
scatter(row2,col2,'<','filled','r')

scatter(row3,col3,'^','filled','r')

scatter(row4,col4,'>','filled','r')

scatter(row5,col5,'v','filled','r')
hold off
drawnow