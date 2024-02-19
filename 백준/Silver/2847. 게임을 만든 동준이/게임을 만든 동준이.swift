let n = Int(readLine()!)!
var scores = [Int]()
var before = 0
var result = 0

for _ in 0..<n {
    scores.append(Int(readLine()!)!)
}
scores.reverse()

for i in 0..<scores.count {
    if i == 0 {
        before = scores[i]
        continue
    }

    if before <= scores[i] {
        result += scores[i] - before + 1
        before -= 1
    } else {
        before = scores[i]
    }
}

print(result)