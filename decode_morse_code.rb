def decode_char(char)
  { A: '.-', B: '-...', C: '-.-.', D: '-..',
    E: '.', F: '..-.', G: '--.', H: '....',
    I: '..', J: '.---', K: '-.-', L: '.-..',
    M: '--', N: '-.', O: '---', P: '.--.',
    Q: '--.-', R: '.-.', S: '...', T: '-',
    U: '..-', V: '...-', W: '.--', X: '-..--',
    Y: '-.--', Z: '--..' }.key(char).to_s
end

def decode_word(word_in_morse)
  word_in_ascii = ''

  word_in_morse.split.each do |char|
    word_in_ascii += decode_char(char)
  end

  word_in_ascii
end

def decode(message)
  message_in_ascii = ''
  last_word = message.split('   ').last

  message.split('   ').each do |word|
    message_in_ascii += if word == last_word
                          decode_word(word).to_s
                        else
                          "#{decode_word(word)} "
                        end
  end

  message_in_ascii
end

print decode('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')
