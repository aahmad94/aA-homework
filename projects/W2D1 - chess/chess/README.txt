Phase II: Display

Write a Display class to handle your rendering logic. Your Display class should access the board. Require the colorize gem so you can render in color.

Download this cursor.rb file. An instance of Cursor initializes with a cursor_pos and an instance of Board. The cursor manages user input, according to which it updates its @cursor_pos. The display will render the square at @cursor_pos in a different color. Within display.rb require cursor.rb and set the instance variable @cursor to Cursor.new([0,0], board).

In cursor.rb we've provided a KEYMAP that translates keypresses into actions and movements. The MOVES hash maps possible movement differentials. You can use the #get_input method as is. #read_char handles console input. Skim over #read_char to gain a general understanding of how the method works. It's all right if the STDIN methods are unfamiliar. Don't fret the details.

Fill in the #handle_key(key) method. Use a case statement that switches on the value of key. Depending on the key, #handle_key(key) will a) return the @cursor_pos (in case of :return or :space), b) call #update_pos with the appropriate movement difference from MOVES and return nil (in case of :left, :right, :up, and :down), or c) exit from the terminal process (in case of :ctrl_c). Later we will use our Player and Game classes to handle the movement of pieces.

NB: To exit a terminal process, use the Process.exit method. Pass it the status code 0 as an argument. You can read more about exit here.

Fill in the #update_pos(diff) method. It should use the diff to reassign @cursor_pos to a new position. You may wish to write a Board#in_bounds method to ensure you update @cursor_pos only when the new position is on the board.

Render the square at the @cursor_pos display in a different color. Test that you can move your cursor around the board by creating and calling a method that loops through Display#render and Cursor#get_input (much as Player#play_turn will function later!).

A nice but optional addition to your cursor class is a boolean instance variable selected that will allow you to display the cursor in a different color when it has selected a piece. To implement this you will need to #toggle_selected everytime :return or :space is hit.

NB: If you're stuck on making a cursor for more than 30 minutes, please call for help from a TA. Fancy cursors are cool, but the purpose of today is to become more familiar with Object-oriented Programming.

Time to test! This time you should run ruby display.rb. Does your board render as you would expect? Make sure that as you move your cursor the display updates accordingly. Test the cursor's behavior when you try and move it off the board (the edge cases if you will). Does it do what you expect?

Code Review Time: Before moving on to piece logic, get a code review from a TA!
