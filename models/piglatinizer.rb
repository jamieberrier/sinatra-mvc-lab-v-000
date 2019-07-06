class PigLatinizer
  attr_reader :text

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize(text)
    words = text.split(" ")

    words.collect! do |word|
      if !consonant?(word[0])
        word << 'w'
      elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
        array = word.chars

        first_letter = array[0]
        second_letter = array[1]
        third_letter = array[2]

        array.delete_at(0)
        array.delete_at(0)
        array.delete_at(0)

        word = array.join + first_letter + second_letter + third_letter + 'ay'
      elsif consonant?(word[0]) && consonant?(word[1])
        array = word.chars

        first_letter = array[0]
        second_letter = array[1]

        array.delete_at(0)
        array.delete_at(0)

        word = array.join + first_letter + second_letter + 'ay'
      else
        first_letter = word.chr
        ending = first_letter + 'ay'

        array = word.chars
        array.delete_at(0)

        word = array.join + ending
      end
    end

    "#{words.join(" ")}"
  end

end
