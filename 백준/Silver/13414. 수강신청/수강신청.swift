let kl = readLine()!.split(separator: " ").compactMap { Int($0) }
let k = kl[0]
let l = kl[1]
var students = [String: Int]()
var result = ""

for i in 0..<l {
    students[readLine()!] = i
}

var sortedStudents = students.sorted(by: { $0.value > $1.value })

for _ in 0..<k {
    if let student = sortedStudents.popLast() {
        result += "\(student.key)\n"
    } else {
        break
    }
}

print(result)