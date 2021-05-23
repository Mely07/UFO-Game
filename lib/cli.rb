class UFOGame::CLI
  @@word #actual word
  @@codeword

  def call
    puts "Welcome to UFO: The Game!"
    puts "Save us from alien abduction by guessing letters in the codeword."
    puts ufo[0]
    puts
    @@word = generate_word
    @@codeword = @@word.gsub(/\S/, '_')
    puts @@codeword
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
  end
 
end


