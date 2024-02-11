%testing the winCheck function

% creating a boardX that X has won and checks if it has
boardX = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 'O', 'X'];

% checks if X has won and displays a message if it has
if winCheck(boardX, 'X')
    disp('X wins!')
else
    disp('X does not win.')
end

% creating a board where O has won and checks if it has
boardO = ['O', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 'O'];

% checking if O is the winner and displaying that O has won
if winCheck(boardO, 'O')
    disp('O wins!')
else
    disp('O does not win.')
end

% creating a board with no winner
boardNoWinner = ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'];

% checking if there is no winner and displaying a message
if winCheck(boardNoWinner, 'X') || winCheck(boardNoWinner, 'O')
    disp('There is a winner.')
else
    disp('There is no winner yet.')
end

%driver function of winCheck runs as expected