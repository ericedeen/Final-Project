% Eric Edeen, eje46, Section 1

% Function updates the x's and o's on the board, changes whose turn it is,
% and makes the background of a button red if pushed while having an 'x' or
% 'o' already within it.
function handles = buttonPress(hObject,handles)

% these commands change the color of all the squares in the tic tac toe 
% board to white after each button press. This ensures that if a button is
% red (after being pushed but having an x or o in it already) it returns
% back to normal after pushing a valid button.
set(handles.A1,'Backgroundcolor','w');
set(handles.A2,'Backgroundcolor','w');
set(handles.A3,'Backgroundcolor','w');
set(handles.B1,'Backgroundcolor','w');
set(handles.B2,'Backgroundcolor','w');
set(handles.B3,'Backgroundcolor','w');
set(handles.C1,'Backgroundcolor','w');
set(handles.C2,'Backgroundcolor','w');
set(handles.C3,'Backgroundcolor','w');


% strcmp here checks if the square is empty since you cannot overwrite
% another person's letter in tic tac toe.
if strcmp(' ',hObject.String)    
    
    % checks if the turn number is even
    if rem(handles.turnNumber,2) == 1
    
    % updates the turn number by adding 1 to the turn number    
    handles.turnNumber = handles.turnNumber + 1;
    
    % updates the string in the button to an 'o'
    hObject.String = 'o';
    
    % updates the whoseturn string to x since it is x's turn.
    handles.whoseTurn.String = 'x';
    
    else
    %If the square is empty and the turn is even, then the string in the
    %box pushed is changed to an 'x' and the whoseTurn string is changed to
    %'o'
    
    % updates the turn number
    handles.turnNumber = handles.turnNumber +1;
    
    % updates the string in the button to an 'x'
    hObject.String = 'x';
   
    % updates the string meant to display whose turn it is to 'o'
    handles.whoseTurn.String = 'o';
    
    end
else
    %if the button already had an 'x' or 'o', then the background of the
    %button pushed is changed to red until an empty button is pushed
set(hObject,'Backgroundcolor','r');
end

% This function checks to see if either player has won and displays the
% results of the game.
function handles = checkWinner(handles)
%This section makes a string out of all the rows, colums, and diagonals of
%the tic tac toe board by combining the x's and o's stored within each
%button. For example the first row would consist of the x's and o's in A1,
%A2, and A3.
row1 = [handles.A1.String,handles.A2.String,handles.A3.String];
row2 = [handles.B1.String,handles.B2.String,handles.B3.String];
row3 = [handles.C1.String,handles.C2.String,handles.C3.String];
col1 = [handles.A1.String,handles.B1.String,handles.C1.String];
col2 = [handles.A2.String,handles.B2.String,handles.C2.String];
col3 = [handles.A3.String,handles.B3.String,handles.C3.String];
diag1 = [handles.A1.String,handles.B2.String,handles.C3.String]; 
diag2 = [handles.A3.String,handles.B2.String,handles.C1.String];

% This if statement checks if x has won after each button push. If any of
% the strings of the rows, colums, or diagonals are the same as 'xxx', then
% x has won since there are three x's in a row.
if strcmp('xxx',row1)||strcmp('xxx',row2)||strcmp('xxx',row3) ...
        ||strcmp('xxx',col1)||strcmp('xxx',col2)||strcmp('xxx',col3)...
        ||strcmp('xxx',diag1)||strcmp('xxx',diag2)
   
    % If X has won, then  'X wins' is displayed within the text box of each
    % square on the tic tac toe board.
    handles.A1.String = 'X Wins';
    handles.A2.String = 'X Wins';
    handles.A3.String = 'X Wins';
    handles.B1.String = 'X Wins';
    handles.B2.String = 'X Wins';
    handles.B3.String = 'X Wins';
    handles.C1.String = 'X Wins';
    handles.C2.String = 'X Wins';
    handles.C3.String = 'X Wins';
    
    % if X wins then the turn Number is reset to zero so that during the
    % next game, if the game goes to turn ten and there is no winner, the
    % game results in a tie.
    handles.turnNumber = 1;
end

% This if statement checks if O has won since if any of the strings row1,
% col1, diag1...ect match the string 'ooo' then O has won since they have
% attained three in a row.
if strcmp('ooo',row1)||strcmp('ooo',row2)||strcmp('ooo',row3) ...
        ||strcmp('ooo',col1)||strcmp('ooo',col2)||strcmp('ooo',col3)...
        ||strcmp('ooo',diag1)||strcmp('ooo',diag2)
   
     % If O has won, then  'O wins' is displayed within the text box of each
    % square on the tic tac toe board.
    handles.A1.String = 'O Wins';
    handles.A2.String = 'O Wins';
    handles.A3.String = 'O Wins';
    handles.B1.String = 'O Wins';
    handles.B2.String = 'O Wins';
    handles.B3.String = 'O Wins';
    handles.C1.String = 'O Wins';
    handles.C2.String = 'O Wins';
    handles.C3.String = 'O Wins';
    
    % if O wins then the turn Number is reset to zero so that during the
    % next game, if the game goes to turn ten and there is no winner, the
    % game results in a tie
    handles.turnNumber = 1;
    
    
% if turn number reaches 10 and there has not been a winner, then the game
% of tic tac toe has certainly ended in a tie. This elseif statement checks
% that if neither X or O has won on the last turn where turnNumber = 10,
% then the game has resulted in a tie.
elseif handles.turnNumber == 10
    
    % if neither player has one Tie becomes the string in all of the
    % buttons on the board.
    handles.A1.String = 'Tie';
    handles.A2.String = 'Tie';
    handles.A3.String = 'Tie';
    handles.B1.String = 'Tie';
    handles.B2.String = 'Tie';
    handles.B3.String = 'Tie';
    handles.C1.String = 'Tie';
    handles.C2.String = 'Tie';
    handles.C3.String = 'Tie';
    
    % if the game ends in a tie, the turn Number is reset to zero so that during the
    % next game, if the game goes to turn ten and there is no winner, the
    % game results in a tie
    handles.turnNumber = 1;
end