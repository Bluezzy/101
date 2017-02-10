def dms(angle) #floating point angle
  total_seconds = angle * 60 * 60
  total_minutes, seconds = total_seconds.divmod(60)
  degrees, minutes = total_minutes.divmod(60)
  result = [format('%02d', degrees.round(0).to_s), 
  format('%02d', minutes.round(0).to_s, ), format('%02d', seconds.round(0).to_s)]
  puts ("%(#{result[0]}°#{result[1]}'#{result[2]}" + '")')
end

VOWELS = "aeiouAEIOU"

def remove_vowels(strings)
  strings.map { |string| string.delete(VOWELS) }
end
