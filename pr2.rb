# Task 1: Find the most frequent element(s)
def most_frequent_elements(array)
  frequency = Hash.new(0)

  array.each { |num| frequency[num] += 1 }

  max_freq = frequency.values.max
  result = frequency.select { |_, freq| freq == max_freq }.keys

  result
end

# Example arrays
test_array1 = [1, 3, 1, 3, 2, 1]
test_array2 = [4, 4, 5, 6, 6, 5]

puts "Most frequent in #{test_array1}: #{most_frequent_elements(test_array1).join(", ")}"
puts "Most frequent in #{test_array2}: #{most_frequent_elements(test_array2).join(", ")}"

# Task 2: Convert sentence to Pig Latin
def pig_latin(sentence)
  sentence.split.map do |word|
    # Separate punctuation
    punctuation = word[-1] =~ /[[:punct:]]/ ? word[-1] : ""
    core_word = punctuation.empty? ? word : word[0..-2]

    if core_word.length > 1
      transformed = core_word[1..] + core_word[0] + "ay"
    else
      transformed = core_word + "ay"
    end

    transformed + punctuation
  end.join(" ")
end

# Example sentences
sentence1 = "Hello world"
sentence2 = "I love Ruby programming!"

puts "Pig Latin: #{pig_latin(sentence1)}"
puts "Pig Latin: #{pig_latin(sentence2)}"
