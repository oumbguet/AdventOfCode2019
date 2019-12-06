file = File.open("input.txt")
input = file.read.split(",").map(&:to_i)
arg = ARGV[0].to_i

def add(input, i, mode)
    a, b, c = input[i + 1..i + 3]
    input[c] = (mode[0] == 0 ? input[a] : a) + (mode[1] == 0 ? input[b] : b)
end

def mult(input, i, mode)
    a, b, c = input[i + 1..i + 3]
    input[c] = (mode[0] == 0 ? input[a] : a) * (mode[1] == 0 ? input[b] : b)
end

def store(input, i, arg, mode)
    a = input[i + 1]
    input[a] = arg
end

def display(input, i, mode)
    a = input[i + 1]
    puts mode == 1 ? a : input[a]
end

def jump_if_true(input, i, mode)
    a, b = input[i + 1..i + 2]
    if ((mode[0] == 0 ? input[a] : a) > 0)
        i = (mode[1] == 0 ? input[b] : b)
    else
        i += 3
    end
    return i
end

def jump_if_false(input, i, mode)
    a, b = input[i + 1..i + 2]
    if ((mode[0] == 0 ? input[a] : a) == 0)
        i = (mode[1] == 0 ? input[b] : b)
    else
        i += 3
    end
    return i
end

def jump_if_false(input, i, mode)
    a, b = input[i + 1..i + 2]
    if ((mode[0] == 0 ? input[a] : a) == 0)
        i = (mode[1] == 0 ? input[b] : b)
    else
        i += 3
    end
    return i
end

def less_than(input, i, mode)
    a, b, c = input[i + 1..i + 3]
    input[c] = ((mode[0] == 0 ? input[a] : a) < (mode[1] == 0 ? input[b] : b)) ? 1 : 0
end

def equals(input, i, mode)
    a, b, c = input[i + 1..i + 3]
    input[c] = ((mode[0] == 0 ? input[a] : a) == (mode[1] == 0 ? input[b] : b)) ? 1 : 0
end

def compute(input, arg)
    i = 0
    tmp = input[i]
    opcode = ((input[i].to_s[-2] != nil ? input[i].to_s[-2] : "") + input[i].to_s[-1]).to_i
    c = input[i] > 9999 ? input[i].to_s[-5].to_i : 0
    b = input[i] > 999 ? input[i].to_s[-4].to_i : 0
    a = input[i] > 99 ? input[i].to_s[-3].to_i : 0

    while (opcode != 99) do
        if (opcode == 1)
            add(input, i, [a, b, c])
        elsif (opcode == 2)
            mult(input, i, [a, b, c])
        elsif (opcode == 3)
            store(input, i, arg, a)
        elsif (opcode == 4)
            display(input, i, a)
        elsif (opcode == 5)
            i = jump_if_true(input, i, [a, b])
        elsif (opcode == 6)
            i = jump_if_false(input, i, [a, b])
        elsif (opcode == 7)
            less_than(input, i, [a, b, c])
        elsif (opcode == 8)
            equals(input, i, [a, b, c])
        end

        i += opcode == 1 || opcode == 2 || opcode == 7 || opcode == 8 ? 4 : opcode == 3 || opcode == 4 ? 2 : 0

        opcode = ((input[i].to_s[-2] != nil ? input[i].to_s[-2] : "") + input[i].to_s[-1]).to_i
        c = input[i] > 9999 ? input[i].to_s[-5].to_i : 0
        b = input[i] > 999 ? input[i].to_s[-4].to_i : 0
        a = input[i] > 99 ? input[i].to_s[-3].to_i : 0
    end
end

compute(input, arg)