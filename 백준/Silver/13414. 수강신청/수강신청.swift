let kl = readLine()!.split(separator: " ").compactMap { Int($0) }
let k = kl[0]
let l = kl[1]
var studentsList = Set<String>()
var orders = [String]()
var reverseOrders = [String]()
var result = ""

for _ in 0..<l {
    let student = readLine()!
    orders.append(student)
    studentsList.insert(student)
}

for i in (0..<l).reversed() {
    if studentsList.contains(orders[i]) {
        reverseOrders.append(orders[i])
        studentsList.remove(orders[i])
    }
}

for _ in 0..<k {
    if let student = reverseOrders.popLast() {
        result += "\(student)\n"
    } else {
        break
    }
}

print(result)