module Keywords
  class Text
    def self.retrieve_words
      input = File.read("_input/input.txt").to_s.downcase

      filename = input.tr " ", "_"

      input_tokens = input.split(" ")

      iteration = input_tokens.size.to_i

      row  = 0

      open("output.rb", "w") { |f|
        iteration.times do
          skipped_word = File.readlines("_skipped/skipwords.txt")

          string = input_tokens[row]

          dquote = '"'

          trim1 = string.strip.tr ",", ""
          trim2 = trim1.tr "#{dquote}", ""
          trim3 = trim2.tr "-", "_"
          trim4 = trim3.tr ".", ""

          if trim4 == skipped_word[0]
            #f.puts "# #{trim4} = :#{trim4}, '#{trim4}', '#{trim4}'"

            #row = row + 1
          #elsif trim4 == "when"
          elsif trim4 == "2020"
          else
            f.puts "#{trim4} = :#{trim4}, '#{trim4}', '#{trim4}'"

            row = row + 1   
          end
        end
      }
    end
  end
end
