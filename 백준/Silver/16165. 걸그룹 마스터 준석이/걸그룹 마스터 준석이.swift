let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var groups = [String: [String]]()
var members = [String: String]()
var result = ""

for _ in 0..<n {
    let group = readLine()!
    for _ in 0..<Int(readLine()!)! {
        let member = readLine()!
        groups[group, default: []].append(member)
        members[member] = group
    }
}

for _ in 0..<m {
    let quiz = readLine()!
    let quizNumber = Int(readLine()!)!
    if quizNumber == 0 {
        for member in groups[quiz]!.sorted() {
            result += "\(member)\n"
        }
    } else {
        result += "\(members[quiz]!)\n"
    }
}

print(result)