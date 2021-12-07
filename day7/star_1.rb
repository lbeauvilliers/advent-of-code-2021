crabs = File.read("crabs.txt").split(",").map(&:to_i)
i = 0
fuel_costs = {}

while i < crabs.max
  cost = crabs.reduce(0) { |sum, crab| sum + (i - crab).abs }
  fuel_costs[i] = cost
  i += 1
end

puts fuel_costs.min_by(&:last).last