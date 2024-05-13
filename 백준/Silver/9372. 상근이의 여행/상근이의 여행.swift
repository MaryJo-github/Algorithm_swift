var result = ""

for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nm[0], m = nm[1]

    for _ in 0..<m {
        _ = readLine()!
    }
    result += "\(n-1)\n"
}

print(result)