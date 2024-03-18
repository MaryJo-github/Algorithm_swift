let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var passwords = [String: String]()
var result = ""

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { String($0) }
    passwords[input[0]] = input[1]
}

for _ in 0..<m {
    result += "\(passwords[readLine()!]!)\n"
}

print(result)