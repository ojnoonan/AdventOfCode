@file = File.read('./2022/Day5.txt')

@instructions, @crates = @file.split("\n\n");

@stacks = {
    "1" => ['W', 'M', 'L', 'F'],
    "2" => ['B', 'Z', 'V', 'M', 'F'],
    "3" => ['H', 'V', 'R', 'S', 'L', 'Q'],
    "4" => ['F', 'S', 'V', 'Q', 'P', 'M', 'T', 'J'],
    "5" => ['L', 'S', 'W'],
    "6" => ['F', 'V', 'P', 'M', 'R', 'J', 'W'],
    "7" => ['J', 'Q', 'C', 'P', 'N', 'R', 'F'],
    "8" => ['V', 'H', 'P', 'S', 'Z', 'W', 'R', 'B'],
    "9" => ['B', 'M', 'J', 'C', 'G', 'H', 'Z', 'W']
}

# VRWBSFZWM
def part_one
    stacks_copy = @stacks
    @crates.split("\n").each do |crate|
        move = crate.split(' ')
        item = nil
        move[1].to_i.times {
            item = stacks_copy[move[3]].pop
            stacks_copy[move[5]].append(item)
        }
    end
    pp stacks_copy
    print "ORDER: "
    stacks_copy.each{|key, array| print array.last}
end

#RBTWJWMCF
def part_two
    stacks_copy = @stacks
    @crates.split("\n").each do |crate|
        move = crate.split(' ')
        items = stacks_copy[move[3]].pop(move[1].to_i)
        items.each do |item|
            stacks_copy[move[5]].append(item)
        end
    end
    pp stacks_copy
    print "ORDER: "
    stacks_copy.each{|key, array| print array.last}
end

part_one
puts ""
part_two