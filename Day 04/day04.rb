a, b = 123257, 647015

def increase(str)
  for i in 0...(str.length - 1)
    if str[i].to_i > str[i + 1].to_i
      return false
    end
  end
  return true
end

def same_nb(str)
  if str[0] == str[1] and str[1] != str[2]
    return true
  end
  if str[3] != str[4] and str[4] == str[5]
    return true
  end
  for i in 0...(3)
    if str[i] != str[i + 1] and str[i + 1] == str[i + 2] and str[i + 2] != str [i + 3]
      return true
    end
  end
  return false
end

count = 0

for i in a..b
  if same_nb(i.to_s) and increase(i.to_s)
    count += 1
  end
end

puts count