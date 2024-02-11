% checking if the draw function works

% creating a board that is not a draw yet
boardNotDraw = ["X", " ", "O"; " ", "O", " "; "X", " ", "X"];

% checking if the board is not a draw and displaying a message
if checkDraw(boardNotDraw)
    disp('The board is a draw.')
else
    disp('The board is not a draw yet.')
end

% creating a board that is a draw
boardDraw = ["X", "O", "O"; "O", "X", "X"; "X", "X", "O"];

% checking if the board is a draw then displaying a message
if checkDraw(boardDraw)
    disp('The board is a draw.')
else
    disp('The board is not a draw yet.')
end

%this function works as expected