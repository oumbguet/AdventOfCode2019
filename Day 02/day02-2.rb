require_relative 'day02'

file = File.open("input.txt")
input = file.read.split(",").map(&:to_i)

0.upto(99) {|i|
    0.upto(99) {|j|
        inp = input.dup
        inp[1], inp[2] = i, j
        compute(inp)
        if (inp[0] > 19000000 && inp[0] < 20000000)
            puts i.to_s + " " + j.to_s
            puts inp[0]
        end
    }
}