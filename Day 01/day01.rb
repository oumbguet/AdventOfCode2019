#ruby 2.5.3

total = 0
file = File.open("input.txt")
file.readlines.map(&:chomp).each {|m|
    fuel = (m.to_i / 3).floor - 2
    while (fuel > 0) do
        total += fuel
        fuel = (fuel / 3).floor - 2
    end
}
puts total