let n = readLine()!
let array = readLine()!.split(separator: " ").map { String($0) }
let v = readLine()!
var result = 0

for i in array {
    if i == v {
        result += 1
    }
}

print(result)