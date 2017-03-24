$winningCombinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    $playerX = Array.new
    $playerO = Array.new
    $gameover = false
    $board = [1,2,3,4,5,6,7,8,9]
$who = "X"

def instructions
    #instructions for play
    puts "Welcome to Tic-Tac-Toe."
    puts "To play, please select the square you wish to select using the following numbers:"  
    puts "Captain X goes first!"
    puts "GLHF!"
end

def win(playerX, playerO, winningCombinations)
    #checks to see if either player has won
    playerX.sort
    playerO.sort
    if winningCombinations.include?(playerX)
        puts "GGWP! Captain X wins!"
        $gameover = true
    elsif winningCombinations.include?(playerO)
        puts "GGWP! Captain O wins!"
        $gameover = true
    end
end

def game
    #mechanics for game
    instructions
        until $gameover == true do
            turn($who)
            win($playerX, $playerO, $winningCombinations)
        end
    puts "Thanks for playing!"
end

def turn(who)
    #mechanics for each turn
    $success = 0
    until $success > 0 do
        selection = 0
        displayBoard($board)
        puts "Please select a square, Captain #{who}."
        selection = gets.to_i
        checkSelection(selection)
    end
end

def checkSelection(selection)
    #checks to make sure the player's selection is a valid choice. If it is valid, it updates the board, and tracks the player's choice in their array. 
   if [1,2,3,4,5,6,7,8,9].include?(selection)
    case 
       when $playerX.include?(selection) && $who == "X"
        puts "You've already picked that one, try again"
       when $playerX.include?(selection) && $who == "O"
        puts "Old mate X already took that one, try again"
       when $playerO.include?(selection) && $who == "X"
        puts "That dingo O already claimed that one, try again"
       when $playerO.include?(selection) && $who == "O"
        puts "You've already picked that one, try again"
    else 
        if $who == "X"
        $playerX.push(selection)
        $board.map!{|x|x == selection ? "X" : x}
        $success += 1
        $who = "O"
        else
        $playerO.push(selection)
        $board.map!{|x|x == selection ? "O" : x}
        $success += 1
        $who = "X"
    end
   end
       else
       puts "Please choose a square using numbers 1 - 9"
   end
end

def displayBoard(board)
   #displays the current board state
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    
end

game