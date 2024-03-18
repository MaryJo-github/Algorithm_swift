let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    result += "\(calculate())\n"
}

print(result)

func calculate() -> Int {
    let n = Int(readLine()!)!
    var accs = [String: Int]()
    var result = 1

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").compactMap { String($0) }
        accs[input[1], default: 0] += 1
    }

    for acc in accs {
        result *= (acc.value + 1)
    }

    return n == 0 ? 0 : result - 1
}