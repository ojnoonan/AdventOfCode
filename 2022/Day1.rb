@calories = File.read('./2022/Day1.txt')
@totals = []
@total = 0

@calories.split("\n").each do |cal|
    if not cal.empty?
        @total += cal.to_i
    else
        @totals.append(@total)
        @total = 0
    end
end

puts "MOST: #{@totals.sort[-1]}"
puts "TOP 3: #{@totals.sort.last(3).sum}"
