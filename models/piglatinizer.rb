class PigLatinizer
  attr_reader :text

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize(text)
    words = text.split(" ")

    words.collect! do |word|
      if !consonant(word[0])#word.start_with?(/[aeouiAEOUI]/)
        word << 'way'
      elsif word.start_with?('sch', 'scr', 'shr', 'spl', 'spr', 'squ', 'str', 'thr', 'Sch', 'Scr', 'Shr', 'Spl', 'Spr', 'Squ', 'Str', 'Thr')
        array = word.chars

        first_letter = array[0]
        second_letter = array[1]
        third_letter = array[2]

        array.delete_at(0)
        array.delete_at(0)
        array.delete_at(0)

        word = array.join + first_letter + second_letter + third_letter + 'ay'
      elsif word.start_with?('bl', 'br', 'ch', 'ck', 'cl', 'cr', 'dr', 'fl', 'fr', 'gh', 'gl', 'gr', 'ng', 'ph', 'pl', 'pr', 'qu', 'sc', 'sh', 'sk', 'sl', 'sm', 'sn', 'sp', 'st', 'sw', 'th', 'tr', 'tw', 'wh', 'wr', 'Bl', 'Br', 'Ch', 'Ck', 'Cl', 'Cr', 'Dr', 'Fl', 'Fr', 'Gh', 'Gl', 'Gr', 'Ng', 'Ph', 'Pl', 'Pr', 'Qu', 'Sc', 'Sh', 'Sk', 'Sl', 'Sm', 'Sn', 'Sp', 'St', 'Sw', 'Th', 'Tr', 'Tw', 'Wh', 'Wr')
        array = word.chars

        first_letter = array[0]
        second_letter = array[1]

        array.delete_at(0)
        array.delete_at(0)

        word = array.join + first_letter + second_letter + 'ay'
      elsif word.start_with?(/[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]/)
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
