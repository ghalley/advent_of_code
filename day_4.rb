require 'digest'

def find_md5(input)
  not_found = true
  number = 0
  while not_found
    md5 = Digest::MD5.new
    md5.update(input)
    md5.update(number.to_s)

    not_found = md5.to_s[0,5] != '00000'
    number += 1 if not_found
  end

  number
end

puts find_md5('ckczppom')