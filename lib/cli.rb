class UFOGame::CLI
  @@incorrect_guesses = 0
  @@word #actual word
  @@codeword

  def call
    puts "Welcome to UFO: The Game!"
    puts "Save us from alien abduction by guessing letters in the codeword."
    puts ufo[0]
    puts
    @@word = generate_word
    @@codeword = @@word.gsub(/\S/, '_')
    puts "Incorrect Guesses:"
    puts @@incorrect_guesses
    puts @@codeword
    puts
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
        if !@@word.include?(letter)
          @@incorrect_guesses += 1
          puts @@codeword
          puts "letter not found, please try again"
          puts "Incorrect Guesses:"
          puts @@incorrect_guesses
          puts ufo[@@incorrect_guesses]
          get_input
        else
          puts "letter found"
          #handle letter found 
        end
      else 
        puts "exceeded # of tries"
      end 
    end
 
end


