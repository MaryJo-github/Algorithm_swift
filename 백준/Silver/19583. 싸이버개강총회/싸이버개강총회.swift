let seq = readLine()!.split(separator: " ").compactMap { String($0) }
let s = Int(seq[0].split(separator: ":").joined())!
let e = Int(seq[1].split(separator: ":").joined())!
let q = Int(seq[2].split(separator: ":").joined())!
var entered = Set<String>()
var completed = Set<String>()

while let input = readLine(), input != "" {
    let line = input.split(separator: " ").compactMap { String($0) }
    let time = Int(line[0].split(separator: ":").joined())!
    let student = line[1]

    if time <= s {
        entered.insert(student)
    } else if time >= e && time <= q {
        if entered.contains(student) {
            completed.insert(student)
        }
    }
}

print(completed.count)