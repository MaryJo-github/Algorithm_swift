let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = ""

var arr = Array(repeating: true, count: numbers[1]+1)
arr[0] = false
arr[1] = false

for i in 2...numbers[1] {
    if arr[i] {
        for j in stride(from: i*2, to: numbers[1]+1, by: i) {
            arr[j] = false
        }
    }
}

for i in numbers[0]...numbers[1] {
    if arr[i] == true {
        result += "\(i)\n"
    }
}

print(result)