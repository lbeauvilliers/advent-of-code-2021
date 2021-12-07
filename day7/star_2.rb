crabs = File.read("crabs.txt").split(",").map(&:to_i)
i = 0
fuel_costs = {}

while i < crabs.max
  cost = crabs.reduce(0) { |sum, crab| sum + triangular((i - crab).abs) }
  fuel_costs[i] = cost
  i += 1
end

puts fuel_costs.min_by(&:last).last

def triangular(n)
  n * (n + 1) / 2
end