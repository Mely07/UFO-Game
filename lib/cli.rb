class UFOGame::CLI
  @@incorrect_guesses = 0
  @@word #actual word
  @@codeword
  @@incorrect_letters = []

  def call
    puts "Welcome to UFO: The Game!"
    puts "Save us from alien abduction by guessing letters in the codeword."
    puts ufo[0]
    puts
    @@word = generate_word
    @@codeword = @@word.gsub(/\S/, '_')
    puts "Incorrect Guesses:"
    puts "None"
    puts @@codeword
    puts
    puts @@word 
    get_input 
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

  def generate_word
    words = File.readlines('./lib/data/nouns.txt')
    num = rand(words.length)
    word = words[num].upcase
  end

  def get_input 
    letter = gets.chomp
    letter = letter.upcase
    search_for_letter(letter)
  end

  def search_for_letter(letter) #handle input
      if @@incorrect_guesses < 6
        if @@codeword.include?('_')
          if @@word.include?(letter)
              puts "Correct! You're closer to cracking the codeword."
              puts ufo[@@incorrect_guesses]
              puts "Incorrect Guesses:"
              print @@incorrect_letters
              puts "Codeword:"
              y = 0
              while y < @@word.length
                if @@word[y] == letter
                  @@codeword[y] = letter
                end
                y += 1
              end
              puts @@codeword
              get_input
          else
            @@incorrect_letters.push(letter)
            @@incorrect_guesses += 1
            puts "Incorrect! The tractor beam pulls the person in further."
            puts ufo[@@incorrect_guesses]
            puts "Incorrect Guesses:"
            print @@incorrect_letters
            puts "Codeword:"
            puts @@codeword
            get_input
          end
        else
          puts "Correct! You saved the person and earned a medal of honor!"
          puts "Would you like to play again (Y/N)? N"
        end
      else  
        puts "exceeded # of tries"
      end 
    end
 
end

