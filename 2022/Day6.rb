@file = File.read('./2022/Day6.txt')

def part_one
    @viewed = []
    @section = []
    @file.split("").each do |content|
        if @section.include? content
            @section.shift(@section.index(content) + 1)
            @section.append(content)
        elsif @section.length == 4 && @section.uniq == @section
            break
        else
            @section.append(content)
        end
        @viewed.append(content)
    end
    return @viewed.length
end

def part_two
    @viewed = []
    @section = []
    @file.split("").each do |content|
        if @section.length == 14 && @section.uniq == @section
            break
        elsif @section.include? content
            @section.shift(@section.index(content) + 1)
            @section.append(content)
        else
            @section.append(content)
        end
        @viewed.append(content)
    end
    p @section
    return @viewed.length
end

# p part_one
p part_two