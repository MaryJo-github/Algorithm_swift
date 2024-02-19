let input = Array(readLine()!)
var before = Character(" ")
var counts = [0, 0]

for i in 0..<input.count {
    if i == 0 {
        before = input[i]
        counts[Int(String(input[i]))!] += 1
        continue
    }

    if before != input[i] {
        counts[Int(String(input[i]))!] += 1
        before = input[i]
    }
}

print(counts.min()!)