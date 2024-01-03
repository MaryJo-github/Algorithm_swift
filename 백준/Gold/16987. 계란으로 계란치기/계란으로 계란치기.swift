let n = Int(readLine()!)!
var p = [Int]()
var weight = [Int]()
var result = 0

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    p.append(line[0])
    weight.append(line[1])
}

recursive(a: 0, p: p)
print(result)

func recursive(a: Int, p: [Int]) {
    if a == n {
        let temp = p.filter { $0 <= 0 }.count
        result = max(temp, result)
        return
    }

    for i in 0..<n {
        guard i != a else { continue }
        guard p[a] > 0, p[i] > 0 else {
            recursive(a: a+1, p: p)
            continue
        }
        var p_ = p
        p_[a] -= weight[i]
        p_[i] -= weight[a]
        recursive(a: a+1, p: p_)
    }
}