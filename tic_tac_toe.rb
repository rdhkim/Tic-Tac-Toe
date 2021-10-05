=begin
tic tac toe
three in a row win
8 possible wins
alternate x's and o's
=end




require 'pry'
class Board
    attr_accessor :choice, :coordinates #:top_row, :middle, :bot_row, :num

    def initialize
        @new_board = Hash.new("[]")
        for i in 1..3
            for j in 1..3
                @new_board.merge!("#{i},#{j}"=> "[ ]")
            end
        end
    end

    def display_board
        #(3).downto(1)
        for i in (3).downto(1)
            print "\n #{i}"
            for j in 1..3
                print @new_board["#{j},#{i}"]
            end
        end
        puts ""
        puts "  1 2 3"
    end

    def start_game
        puts "Welcome to Tic Tac Toe
        To Win you must get three in a row"

        display_board()

        until @win == true

            puts "Player 1 chose a location to place an \"X\" (use co-ordinates between 1-3: (Ex. 1(x),2(y))"
            
            choice = gets.chomp
            coordinates = Array.new
            coordinates = choice.split(%r{,\s*}).map(&:to_i)
        
            until coordinates[0].between?(1,3) and coordinates[1].between?(1,3) and @new_board[choice] == "[ ]"
                puts "Put a valid coordinate between 1-3 (Ex. 2,3 and not already filled)"
                choice = gets.chomp
                coordinates = choice.split(%r{,\s*}).map(&:to_i)
            end
            
    
            keys = @new_board.keys
            

            for i in 0...9
                if choice == keys[i]
                    @new_board[keys[i]] = "[X]"
                end
            end


            display_board()

            check_win()
            if @win == true
                break
            end
            puts "Player 2 chose a location to place an \"O\" (use co-ordinates between 1-3: (Ex. 1(x),2(y))"
            
            choice = gets.chomp
            coordinates = Array.new
            coordinates = choice.split(%r{,\s*}).map(&:to_i)
        
            until coordinates[0].between?(1,3) and coordinates[1].between?(1,3) and @new_board[choice] == "[ ]"
                puts "Put a valid coordinate between 1-3 (Ex. 2,3 and not already filled)"
                choice = gets.chomp
                coordinates = choice.split(%r{,\s*}).map(&:to_i)
            end

            for i in 0...9
                if choice == keys[i]
                    @new_board[keys[i]] = "[O]"
                end
            end
            
            display_board()
            check_win()
        end
        puts "Game over"
    end

    def check_win
        for i in 1..3
            if @new_board["#{i},1"] == "[X]" and @new_board["#{i},2"] == "[X]" and @new_board["#{i},3"] == "[X]"
                @win= true
            elsif @new_board["#{i},1"] == "[O]" and @new_board["#{i},2"] == "[O]" and @new_board["#{i},3"] == "[O]"
                @win= true
                
            elsif @new_board["1,#{i}"] == "[X]" and @new_board["2,#{i}"] == "[X]" and @new_board["3,#{i}"] == "[X]"
                @win = true
            
            elsif @new_board["1,#{i}"] == "[O]" and @new_board["2,#{i}"] == "[O]" and @new_board["3,#{i}"] == "[O]"
                @win= true
                
            end
        end

        if @new_board["1,1"] == "[X]" and @new_board["2,2"] == "[X]" and @new_board["3,3"] == "[X]"
            @win= true
            
        elsif @new_board["1,1"] == "[O]" and @new_board["2,2"] == "[O]" and @new_board["3,3"] == "[O]"
            @win= true
            
        elsif @new_board["1,3"] == "[X]" and @new_board["2,2"] == "[X]" and @new_board["3,1"] == "[X]"
            @win= true
            
        elsif @new_board["1,3"] == "[O]" and @new_board["2,2"] == "[O]" and @new_board["3,1"] == "[O]"
            @win= true
        end
    end
end

board1 = Board.new
board1.start_game
