def longest_sentence(text)
  sentences = text.split(/[.?!]/)
  nb_of_words = {}
  sentences.each do |sentence|
    words = sentence.split
    nb_of_words[sentence] = words.count
  end
  puts "\n\nThe longest sentence is : \n\n#{nb_of_words.key(nb_of_words.values.max)}"
  puts "\nIt contains #{nb_of_words.values.max} words."
end

def block_word?(word)
  blocks = [["B","O"], ["X","K"], ["D","Q"], ["C","P"], ["N","A"],
  ["G","T"], ["R","E"], ["F","S"], ["J","W"], ["H","U"],
  ["V","I"], ["L","Y"], ["Z","M"]]
  word = word.upcase
  characters = word.chars
  characters.each do |char|
    if blocks.none? { |couple| couple.include?(char) }
      return false
    else
      blocks.each do |couple|
        if couple.include?(char)
          blocks.delete(couple)
        end
      end
    end
  end
  true
end

def letter_percentages(string)
  lowercases = ("a".."z").to_a
  uppercases = ("A".."Z").to_a
  count = { lowercases: 0, uppercases: 0, neither: 0}
  percentages = { lowercases: 0.0, uppercases: 0.0, neither: 0.0}
  characters = string.chars
  characters.each do |char|
    if lowercases.include?(char)
      count[:lowercases] += 1
    elsif uppercases.include?(char)
      count[:uppercases] += 1
    else
      count[:neither] += 1
    end
  end
  total = count.values.reduce(:+).to_f
  percentages.each do |type, _|
    percentages[type] = (count[type] / total) * 100
  end
  p percentages
end

