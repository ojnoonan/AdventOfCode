@sections = File.read('./2022/Day4.txt')
@fully_contained = 0
@overlap = 0

@sections.split("\n").each do |section|
    range1_str, range2_str = section.split(",")
    range1_half1, range1_half2 = range1_str.split("-")
    range1 = (range1_half1.to_i..range1_half2.to_i).to_a
    range2_half1, range2_half2 = range2_str.split("-")
    range2 = (range2_half1.to_i..range2_half2.to_i).to_a
    if (range1 - range2).empty? || (range2 - range1).empty?
        @fully_contained += 1
    end
    # p (range1 & range2)
    # p (range1 & range2).empty?
    if not (range1 & range2).empty?
        @overlap += 1
    end
end

puts @fully_contained
puts @overlap