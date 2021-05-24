class UFOGame::CLI
  @@incorrect_guesses
  @@word #actual word
  @@codeword
  @@incorrect_letters 
  @@encouragements 


  def call
    # Initialize variables
    @@incorrect_guesses = 0
    @@incorrect_letters = []
    @@encouragements = File.readlines('./lib/data/messages.txt')

    # Start the game
    puts "Welcome to UFO: The Game!"
    puts "Save us from alien abduction by guessing letters in the codeword."
    puts ufo[0]
    puts

    # Call to generate random word
    @@word = generate_word
    @@codeword = @@word.gsub(/\S/, '_')
    puts "Incorrect Guesses:"
    puts "None"
    puts @@codeword
    puts
    puts @@word 

    # Start handling user input
    get_input 

    # Allow the user to continue playing after complete run
    puts "Would you like to play again (Y/N)?"
    yn = gets.chomp.upcase
    handle_input(yn)
  end

  def generate_word
    words = File.readlines('./lib/data/nouns.txt')
    num = rand(words.length)
    word = words[num].upcase.chomp
  end

  def get_input 
    letter = gets.chomp.upcase

    if (letter.match(/^[A-Za-z]+$/)) && (letter.length == 1)
      if @@incorrect_letters.include?(letter) || @@codeword.include?(letter)
        puts" You can only guess that letter once, please try again."
        get_input
      else
        search_for_letter(letter)
      end
    else
      puts "I cannot understand your input. Please guess a single letter."
      get_input
    end
  end

  def search_for_letter(letter) 
    # Check if user has guessed a correct letter
    if @@word.include?(letter)
      # Correct letter guessed, update the codeword with the letters found
      y = 0
      while y < @@word.length
        if @@word[y] == letter
          @@codeword[y] = letter
        end
        y += 1
      end
      
      # Check if the user has guessed the whole word
      if @@codeword.include?('_')
        # There are still letters remaining, continue getting input
        puts "Correct! You're closer to cracking the codeword."
        puts ufo[@@incorrect_guesses]
        puts "Incorrect Guesses:"
        print @@incorrect_letters
        puts
        puts "Codeword:"
        puts @@codeword
        get_input
      else
        # User has guessed the word correctly
        puts "Correct! You saved the person and earned a medal of honor!"
        puts "The codeword is: #@@word."
      end

    else
      # Incorrect letter guessed; update guess count and add to incorrect guesses array
      @@incorrect_letters.push(letter)
      @@incorrect_guesses += 1
      if @@incorrect_guesses < 6
        # Guesses still remaining
        puts "Incorrect! The tractor beam pulls the person in further."
        
        #encouragement 
        num = rand(@@encouragements.length)
        encouraging_message = @@encouragements[num]
        puts encouraging_message
        
        puts ufo[@@incorrect_guesses]
        puts "Incorrect Guesses:"
        print @@incorrect_letters
        puts
        puts "Codeword:"
        puts @@codeword
        get_input
      else  
        # No more guesses still remaining
        puts "The aliens have taken over!"
        puts ufo[6]
      end 
    end
  end

  def handle_input(yn)
    if yn.match(/^Y$/) || yn.match(/^N$/)
      if yn == "Y"
        call
      elsif  yn == "N"
        puts "Goodbye!"
      end
    else
      puts "Please enter Y/N"
      yn = gets.chomp.upcase
      handle_input(yn)
    end
end

  def ufo
x = ["                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /     \\
             /       \\
            /    O    \\
           /   --|--   \\
          /      |      \\
         /      / \\      \\
",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /     \\
             /   O   \\
            /  --|--  \\
           /     |     \\
          /     / \\     \\
         /               \\
",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /  O  \\
             / --|-- \\
            /    |    \\
           /    / \\    \\
          /             \\
         /               \\
",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /--|--\\
             /   |   \\
            /   / \\   \\
           /           \\
          /             \\
         /               \\
",
"                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /  |  \\
             /  / \\  \\
            /         \\
           /           \\
          /             \\
         /               \\
",
"
                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              / / \\ \\
             /       \\
            /         \\
           /           \\
          /             \\
         /               \\
",
"
                 .
                 |
              .-\"^\"-.
             /_....._\\
         .-\"`         `\"-.
        (  ooo  ooo  ooo  )
         '-.,_________,.-'
              /     \\
             /       \\
            /         \\
           /           \\
          /             \\
         /               \\
"]
  end
 
end

