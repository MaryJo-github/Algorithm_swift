let seq = readLine()!.split(separator: " ").compactMap { String($0) }
let s = seq[0].split(separator: ":").compactMap { Int($0) }
let e = seq[1].split(separator: ":").compactMap { Int($0) }
let q = seq[2].split(separator: ":").compactMap { Int($0) }
var entered = Set<String>()
var completed = Set<String>()

while let input = readLine(), input != "" {
    let line = input.split(separator: " ").compactMap { String($0) }
    let time = line[0].split(separator: ":").compactMap { Int($0) }
    let student = line[1]

    if time[0] < s[0] || time[0] == s[0] && time[1] <= s[1] {
        entered.insert(student)
    } else if time[0] > e[0] || time[0] == e[0] && time[1] >= e[1] {
        if time[0] < q[0] || time[0] == q[0] && time[1] <= q[1] {
            if entered.contains(student) {
                completed.insert(student)
            }
        }
    }
}

print(completed.count)