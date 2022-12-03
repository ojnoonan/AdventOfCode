@rucksacks = File.read('./2022/Day3.txt')

lower = ('a'..'z').to_a
upper = ('A'..'Z').to_a
@priorities = lower + upper
@group = 0
@prior_total = []
@group_prior_total = []
@count = 0
@group_sacks = []

def count_in_string(str, substr)
    str.scan(/(?=#{substr})/).count
end

def get_common_letter(common)
    letter_appears = []
    common.each do |letter|
        letter_appears.append(count_in_string(common.to_s, letter))
    end
    return common[letter_appears.index(letter_appears.max())]
end

@rucksacks.split("\n").each do |rucksack|
    sack1, sack2 = rucksack.chars.each_slice(rucksack.length / 2).map(&:join)
    common = sack1.split("") & sack2.split("")
    most = get_common_letter(common)
    pindex = @priorities.index(most) + 1
    @prior_total.append(pindex)
    # puts "#{most}:#{pindex}"

    if @count == 2
        @group_sacks.append(rucksack)
        same_letter = (@group_sacks[0].split("") & @group_sacks[1].split("") & @group_sacks[2].split(""))[0]
        letter_prior = @priorities.index(same_letter) + 1
        @group_prior_total.append(letter_prior)
        # puts "#{same_letter}:#{letter_prior}"
        # p @group_sacks
        @group_sacks = []
        @count = 0
    else
        @group_sacks.append(rucksack)
        @count += 1
    end
end

puts "TOTAL: #{@prior_total.sum}"
puts "GROUP: #{@group_prior_total.sum}"