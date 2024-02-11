function win = winCheck(board, player)
    win = false;
    if board(1) == player && board(2) == player && board(3) == player
        win = true;
    elseif board(4) == player && board(5) == player && board(6) == player
        win = true;
    elseif board(7) == player && board(8) == player && board(9) == player
        win = true;
    elseif board(1) == player && board(4) == player && board(7) == player
        win = true;
    elseif board(2) == player && board(5) == player && board(8) == player
        win = true;
    elseif board(3) == player && board(6) == player && board(9) == player
        win = true;
    elseif board(1) == player && board(5) == player && board(9) == player
        win = true;
    elseif board(3) == player && board(5) == player && board(7) == player
        win = true;
    end
end