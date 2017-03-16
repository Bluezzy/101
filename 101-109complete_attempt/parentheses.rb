def balanced_parentheses?(string)
  return false if (string.count("()") <= 0) || (string.count("(") != string.count(")"))
  left_parentheses_counter = 0
  right_parentheses_counter = 0
  string.chars.each do |char|
    return false if (right_parentheses_counter > left_parentheses_counter)
    if char == "("
      left_parentheses_counter += 1
    elsif char == ")"
      right_parentheses_counter += 1
    else
      next
    end
  end
  true
end
