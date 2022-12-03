@guide = File.read('./2022/Day2.txt')
@round_scores = []
@total = 0

@totals2 = []

@guide.split("\n").each do |set|
    opp, you = set.split(" ")
    case you
    when 'X' #rock
        if opp == 'C' #scissor
            @total += 2
            @round_scores.append(1 + 6)
            @totals2.append(2) # C X = 3
        elsif opp == 'A'
            @total += 3
            @round_scores.append(1 + 3)
            @totals2.append(3) # A X = 1
        else
            @total += 1
            @round_scores.append(1)
            @totals2.append(1) # B X = 2
        end
    when 'Y' #paper
        if opp == 'A' #rock
            @total += (1 + 3)
            @round_scores.append(2 + 6)
            @totals2.append(1 + 3) # A Y = 1 + 3
        elsif opp == 'B'
            @total += (2 + 3)
            @round_scores.append(2 + 3)
            @totals2.append(2 + 3) # B Y = 2 + 3
        else
            @total += (3 + 3)
            @round_scores.append(2)
            @totals2.append(3 + 3) # C Y = 3 + 3
        end
    when 'Z' #scissor
        if opp == 'B' #paper
            @total += (2 + 6)
            @round_scores.append(3 + 6)
            @totals2.append(3 + 6) # B Z = 2 + 6
        elsif opp == 'C'
            @total += (3 + 6)
            @round_scores.append(3 + 3)
            @totals2.append(1 + 6) # C Z = 3 + 6
        else
            @total += (1 + 6)
            @round_scores.append(3)
            @totals2.append(2 + 6) # A Z = 1 + 6
        end
    end
    # puts "TOTAL: #{@total} OPP: #{opp} YOU: #{you}"
end

puts @round_scores.sum
puts @totals2.sum