let n = Int(readLine()!)!
var weights = [Int]()
var numberOfLope = 1
var result = 0

for _ in 0..<n {
    weights.append(Int(readLine()!)!)
}

weights.sort()

for i in stride(from: n-1, through: 0, by: -1) {
    result = max(result, weights[i] * numberOfLope)
    numberOfLope += 1
}

print(result)