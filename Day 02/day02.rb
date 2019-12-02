#ruby 2.5.3

file = File.open("input.txt")
input = file.read.split(",").map(&:to_i)

def add(input, i)
    a, b, c = input[i + 1], input[i + 2], input[i + 3]
    input[c] = input[a] + input[b]
end

def mult(input, i)
    a, b, c = input[i + 1], input[i + 2], input[i + 3]
    input[c] = input[a] * input[b]
end

def compute(input)
    i = 0
    while (input[i] != 99) do
        if (input[i] == 1)
            add(input, i)
        elsif (input[i] == 2)
            mult(input, i)
        end
        i += input[i] == 1 || input[i] == 2 ? 4 : 0
    end
end

compute(input)
puts input[0]