file = open("input.txt")
input = file.readlines.map(&:chomp)

class Node
    attr_accessor :next
    attr_reader   :value
    attr_reader   :dist
    def initialize(value, dist)
        @value = value
        @dist = dist
        @next  = []
    end
    def to_s
      "Node with value: #{@value} at dist #{@dist}"
    end
end

def find_by(input, name, dist)
    arr = []
    input.each do |w|
        if (w.split(')')[0] == name)
            new_node = Node.new(w.split(')')[1], dist + 1)
            arr.push(new_node)
        end
    end
    return arr
end

def loop(current, input, total)
    total += current.dist
    current.next = find_by(input, current.value, current.dist)
    current.next.each do |w|
        total = loop(w, input, total)
    end
    return total
end

def print_linked(current)
    puts current
    puts
    current.next.each do |w|
        print_linked(w)
    end
end

head = Node.new("COM", 0)
current = head
total = 0

total = loop(current, input, total)

print_linked(head)

puts total