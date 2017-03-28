def instructions
    #instructions for play
    puts "Welcome to Tic-Tac-Toe."
    puts "To play, please select the square you wish to select using the following numbers:"  
    puts "Captain X goes first!"
    puts "GLHF!"
end

def win(playerX,playerO,board)
    winningCombinations = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]
    
    def checker(board,x)
        #checks the board against the winning combinations
        if board[x[0]] == board[x[1]] && board[x[0]] == board[x[2]]
            return true
        else
            return false
        end
    end
    
    winningCombinations.each do |x|
        if checker(board,x)
            puts "GGWP! Captain#{board[x[0]]} wins!"
            $gameover = true
        end
    end
end

def game
    #mechanics for game
    $who = "X"
    instructions
    board = (1..9).to_a
    playerX = Array.new
    playerO = Array.new
    $gameover = false
        until $gameover == true do
            turn(board,playerX,playerO)
            win(playerX,playerO,board)
        end
    displayBoard(board)
    puts "Thanks for playing!"
end

def turn(board,playerX,playerO)
    #mechanics for each turn
    success = false
    until success == true do
        selection = 0
        displayBoard(board)
        puts "Please select a square, Captain #{$who}."
        selection = gets.to_i
        success = checkSelection(playerX,playerO,selection,success)
        if success == true
            update(playerX,playerO,selection,board,success)
        end
    end
end

def checkSelection(playerX,playerO,selection,success)
    #checks to make sure the player's selection is a valid choice. If it is valid, it updates the board, and tracks the player's choice in their array. 
   if [1,2,3,4,5,6,7,8,9].include?(selection)
    case 
       when playerX.include?(selection) && $who == "X"
        puts "You've already picked that one, try again"
        return false
       when playerX.include?(selection) && $who == "O"
        puts "Old mate X already took that one, try again"
        return false
       when playerO.include?(selection) && $who == "X"
        puts "That dingo O already claimed that one, try again"
        return false
       when playerO.include?(selection) && $who == "O"
        puts "You've already picked that one, try again"
        return false
        else return true
    end
   else
       puts "Please choose a square using numbers 1 - 9"
        return false
   end
end

def update(playerX,playerO,selection,board,success)
        if $who == "X"
        playerX.push(selection)
        board.map!{|x|x == selection ? "X" : x}
        success = true
        $who = "O"
        else
        playerO.push(selection)
        board.map!{|x|x == selection ? "O" : x}
        success = true
        $who = "X"
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
