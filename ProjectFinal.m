%starting the game
clear all;
clc;
%Introducing the game
disp('Hi hero, the planet Agoria is in grave danger!');
pause(2)
disp('The evil force LP has taken our princess Amelia hostage');
pause(2)
disp('You are the hero chosen to defeat LP and save the princess');
pause(2)
disp('The future of Agoria is in your hands, what are you waiting for!');
pause(2)

while (1)
    %make a pop-up menu that only allows the selection of yes or else it
    %will keep looping
    options = menu('Ready to defeat LP and save princess Amelia?', 'Yes', 'No');
    if options == 1
        break
    end
end

%dialogue for the mission
clc;
disp("Great! Let's get started!");
pause(2)
disp('In order to get to the princess you have to go through 3 stages');
pause(3)
disp('The first stage is getting through the great gate keeper of LP');
pause(3)
disp('In order to get through him, you have to verse him in a game of tic tac toe');
pause(3)
clc;
disp('MWAHAHAHA, is this the hero that is here to get princess Amelia back?');
pause(3)
disp('How pathetic, a tiny puny hero HAHAHAHA');
pause(3)
disp('So challenging me to a tic tac toe match huh?');
pause(3)
disp("Here's how it's going to work, we play 1 game");
pause(3)
disp("If you win I'll let you pass, if you lose I'll throw you down into the lava pit");
pause(3)
disp('If we tie, we will keep playing until one of us wins');
pause(2.5)
clc;
disp("Let's flip a coin to decide who goes first, hero, if it's tails I go first else you go");
pause(3.5)
fprintf("I'll be O and you can be X, hero\n");
pause(2.5)

start = true;
while start
    % setting up the board
    board = [" ", " ", " "; " ", " ", " "; " ", " ", " "];
    % flipping a coin to decide who goes first
    if randi(2) == 1
        %If the random number is 1, then display heads, assign the hero player to the
        %variable X
        fprintf("It's heads\n")
        player = "X";
        fprintf("You go first hero\n");
        pause(1.5)
    else
        %if the random number is 2, then display tails, assign the
        %gatekeeper player to the variable O
        player = "O";
        fprintf("It's tails\n")
        fprintf("I'll go first\n");
        pause(1.5)
    end
    
    % starting the tictactoe game loop
    startGame = true;
    while startGame
    % setting up the board by printing out the lines and also assigning the
    % values in the board into the print strings
        fprintf("| %s | %s | %s |", board(1,1), board(1,2), board(1,3))
        fprintf('\n')
        fprintf('_____________')
        fprintf('\n')
        fprintf("| %s | %s | %s |", board(2,1), board(2,2), board(2,3))
        fprintf('\n')
        fprintf('_____________')
        fprintf('\n')
        fprintf("| %s | %s | %s |", board(3,1), board(3,2), board(3,3))
        fprintf('\n')
    
        % getting the hero moves and the gatekeeper moves, checking if it's
        % the hero's move by seeing if player == "X" 
        if player == "X"
            turn = true;
            while turn
                % the number 1 to 9 go from the 1 as the first row first
                % column, then 2 for the second row first column and 3 as the
                % third row third column and so on. I did this so that the
                % user could input a singular number instead of 2 numbers,
                % 1 for a row and 1 for a column
                move = input("\nGo hero, it's your turn make a move between 1-9: ");
                %checking if the number input for move is invalid and
                %printing a message
                if move < 1 || move > 9
                    fprintf("Are you a stupid hero, do you not understand instructions?\n")
                elseif board(move) ~= " "
                    %checking if the board element is empty or not and
                    %printing a message
                    fprintf("How did you pick a space that is already picked? Are you a stupid hero?\n")
                else
                    %if the input for move is valid exit out of the while
                    %loop
                    turn = false;
                end
            end
        else % gatekeeper makes a random move, by first finding an empty part of the board and placing in O
            gatekeeperMove = find(board == " ");
            % assigning the variable move to a random element in the vector
            % gatekeeperMove
            move = gatekeeperMove(randi(length(gatekeeperMove)));
            % print the move that the gatekeeper chose
            fprintf("\nI choose %d\n", move)
        end
    
        % updating the board and then displaying who won and if it was a draw
        % replacing the board with the move of the player, whether that be
        % player X or player O
        board(move) = player;
        %checking if the hero won by seeing all the possible combinations
        %of 3 X's being in a row, if it's true print out the winning board
        %and display a message as well as a picture
        if winCheck(board, player) && player == "X"
            fprintf("| %s | %s | %s |", board(1,1), board(1,2), board(1,3))
            fprintf('\n')
            fprintf('_____________')
            fprintf('\n')
            fprintf("| %s | %s | %s |", board(2,1), board(2,2), board(2,3))
            fprintf('\n')
            fprintf('_____________')
            fprintf('\n')
            fprintf("| %s | %s | %s |", board(3,1), board(3,2), board(3,3))
            fprintf('\n')
            fprintf("\nYou win hero, you may move onto the next stage, I hope you like guessing numbers\n");
            imshow('gateopening.jpeg')
            %exiting out of the inner while loop but continuing on the
            %outer while loop
            startGame = false;
            %checking if the gatekeeper won by seeing all the possible combinations
            %of 3 O's being in a row, if it's true print out the winning board
            %and display a message as well as a picture
        elseif winCheck(board, player) && player == "O"
            fprintf("| %s | %s | %s |", board(1,1), board(1,2), board(1,3))
            fprintf('\n')
            fprintf('_____________')
            fprintf('\n')
            fprintf("| %s | %s | %s |", board(2,1), board(2,2), board(2,3))
            fprintf('\n')
            fprintf('_____________')
            fprintf('\n')
            fprintf("| %s | %s | %s |", board(3,1), board(3,2), board(3,3))
            fprintf('\n')
            fprintf('\nYou lost! prepare to be thrown into lava MWAHAHA\n')
            imshow('lava.jpeg')
            %exiting out of the inner while loop and also exiting the outer
            %while loop
            startGame = false;
            start = false;
        elseif checkDraw(board) %checking if it a draw, if it is start the whole game again until the hero wins or the gatekeeper loses
            fprintf("\nIt's a draw, let's start again hero\n");
            startGame = true;
            board = [" ", " ", " "; " ", " ", " "; " ", " ", " "];
            if randi(2) == 1
                fprintf("It's heads\n")
                player = "X";
                fprintf("You go first hero\n");
            else
                player = "O";
                fprintf("It's tails\n")
                fprintf("I'll go first\n");
            end
        else
            % switching players, from hero to gatekeeper or the other way around
            if player == "X"
                player = "O";
            else
                player = "X";
            end
        end
    end
    
    %the code responsible for breaking out the while loop when the hero
    %loses
    if start == false
        break
    end

    %dialogue for the second stage of saving the princess
    pause(4)
    clc;
    disp("Here is the second stage of the three stages, LP's royal knight");
    pause(2.5)
    disp("Hi puny hero, I'm suprised you beat the gatekeeper");
    pause(2)
    disp("I'm LP's royal knight and in order to pass through me you need to guess the number I am thinking of");
    pause(3)
    disp("I'll give you 10 chances to guess the number");
    pause(2.5)
    disp("If you don't get it within the 10 chances, I'll push you off the cliff");
    pause(2.5)
    %creating a number between 1 to 50
    disp("My number is between 1 to 50");
    %create a variable and assign it to a random number between 1 to 50
    guessNum = randi(50);
    %prompting the hero to input a number
    guess = input("Guess the number hero: ");
    %creating a counter that keeps track of how many guesses the hero has
    %had
    counter = 9;
    %loop through it 9 times
    for i = 1:9
        %checking if the input of the hero is less than the actual number,
        %if it is then display a message
        if guess < guessNum
            disp("The number is higher than that hero");
            fprintf("You have %d chances left till I push you off the cliff hero\n", counter);
            guess = input("Give me another number hero: ");
            %reduce the counter by 1
            counter = counter - 1;
        elseif guess > guessNum
            %checking if the input of the hero is more than the actual
            %number, if it is then display a message
            disp("The number is lower than that hero");
            fprintf("You have %d chances left till I push you off the cliff hero\n", counter);
            guess = input("Give me another number hero: ");
            %reduce the counter by 1
            counter = counter - 1;
        else
            %if the hero guesses the number correctly display a message and
            %a picture then break out of the for loop and continue on the
            %outer while loop
            disp("That is the correct number, well done hero, you may pass");
            imshow('castleopening.jpeg')
            break
        end
    end
    %checking if the counter reached 0, if it has then display a message
    %and an image
    if counter == 0
        disp("You lost! Be prepared to be pushed off the cliff");
        imshow('cliff.jpeg')
        %exiting out of the outer while loop
        start = false;
    end
    %the code responsible for breaking out the while loop when the hero
    %loses
    if start == false
        break
    end
    
    clc;
    %displaying more dialogue
    pause(2.5)
    disp("Well done hero, here is the last stage of the three stages, LP himself")
    pause(2.5)
    disp("Oh wow hero, didn't think you could make it this far MWAHAHAHA")
    pause(3)
    disp("You think you can save princess Amelia?")
    pause(2)
    disp("Let's play a game of guess the word")
    pause(2.5)
    disp("I'll give you 5 chances to guess the characters of a word I'm thinking")
    pause(3)
    disp("But each character you get wrong I'll lower the princess into the lava pit")
    pause(3)
    disp("MWAHAHAHA, goodluck hero, you'll need it")
    pause(2.5)
    clc;

    % Setting up hangman, giving a word list with 8 words
    wordList = {'cauldron', 'enchanted','bewitch','demonic','heathen','castle','chamber','conjure'};
    %randomly assigning the variable to a word in the word list
    word = wordList{randi(length(wordList))};
    %assigning the length of the word to wordLength
    wordLength = length(word);
    unknown = [];
    wrongNum = 0;
    rightNum = 0;
    numGuessesLeft = 5;
    lettersUsed = [];
    guessesMade = [];
    %making a for loop to create '-' as a place holder for each letter of the
    %word
    for i = 1:wordLength
        unknown = [unknown '-'];
    end
    
    %printing a message by LP to the hero
    fprintf("Hero, the word I'm thinking of has %d letters in it: %s\n", wordLength, unknown);
    
    % start a while loop that works if the number of wrong guesses does not
    % exceed the given amount of 5 wring guesses also if that the right number
    % of guesses does not exceed the length of the actual word
    while wrongNum < numGuessesLeft && rightNum < wordLength
        % getting the hero's input
        guess = input('Guess the character in lowercase hero: ','s');
        
        % checking if the letter has been guessed before
        if ~ismember(guess, lettersUsed)
            % adding the letter that was guessed into a lettersUsed vector
            lettersUsed = [lettersUsed, guess];
            
            % checking if the letter is in the word
            if ismember(guess, word)
                for i = 1:wordLength
                    if word(i) == guess
                        unknown(i) = guess;
                        rightNum = rightNum + 1;
                    end
                end
                
                % if letter is in the word print out a message
                fprintf("Impressive hero! The letter %s is indeed in the word I'm thinking of\n", guess);
                fprintf('The word looks like this now, hero: %s\n', unknown);
            else
                % updating the wrong number counter if the guess was wrong
                wrongNum = wrongNum + 1;
                
                % printing out message if the letter was not in the word
                fprintf("Stupid hero, the letter %s is not in the word I'm thinking of\n", guess);
                fprintf('Here are the letters you have guessed so far, hero: %s\n', lettersUsed);
                fprintf('The word is still like this, hero: %s\n', unknown);
            end
            % 
            currentGuesses = numGuessesLeft - wrongNum;
            % displaying the number of guesses left
            fprintf('Hero, you have %d guesses left.\n', currentGuesses);
            %depending on the number of guesses left display a series of ascii
            %characters that show the princess is falling into the lava
            if currentGuesses == 4
                fprintf('_______________\n');
                fprintf('|              |\n');
                fprintf('|              |\n');
                fprintf('|              O\n');
                fprintf('|             /|\\\n');
                fprintf('|             / \\\n');
                fprintf('|\n')
                fprintf('|\n');
                fprintf('|\n');
                fprintf('|__________________\n');
                fprintf("Help Hero!\n")
            elseif currentGuesses == 3
                fprintf('_______________\n');
                fprintf('|              |\n');
                fprintf('|              |\n');
                fprintf('|              O\n');
                fprintf('|             /|\\\n');
                fprintf('|             / \\\n');
                fprintf('|\n');
                fprintf('|\n');
                fprintf('|__________________\n');
                fprintf("Hero I'm scared!\n")
            elseif currentGuesses == 2
                fprintf('_______________\n');
                fprintf('|              |\n');
                fprintf('|              |\n');
                fprintf('|              O\n');
                fprintf('|             /|\\\n');
                fprintf('|             / \\\n');
                fprintf('|\n')
                fprintf('|__________________\n');
                fprintf("Hero I can feel the lava!\n")
            elseif currentGuesses == 1
                fprintf('_______________\n');
                fprintf('|              |\n');
                fprintf('|              |\n');
                fprintf('|              O\n');
                fprintf('|             /|\\\n');
                fprintf('|             / \\\n');
                fprintf('|__________________\n');
                fprintf("Hero please save me!\n") 
            end
        else
            % print a message for repeated guesses of the same letter
            fprintf('Stupid hero, you already guessed the letter %s, try another one\n', guess);
        end
    end
    
    % when the word is guessed correctly display a message
    if rightNum == wordLength
        fprintf("WOW HERO, goodjob, I LP agree to return back princess Amelia, but you wait next time you won't win\n")
        imshow('princesssaved.png')
        start = false;
    else
        % when the guesses run out display another message
        fprintf("The word I was thinking of was %s, but that doesn't matter because the princess is dead MWHAHAHA\n", word);
        imshow('princessdead.png');
        start = false;
    end
    if start == false
        break
    end
end

    


% creating a function to check if the player has won by going through all
% the possible combinations
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

% creating a function to check if it is a draw
function draw = checkDraw(board)
% finding if the whole board is filled
    draw = all(board ~= " ");
end