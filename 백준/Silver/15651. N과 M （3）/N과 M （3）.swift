let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var choosed = Array(repeating: 0, count: line[1])
var result = [String]()

recursive(a: 0)
print(result.joined(separator: "\n"))

func recursive(a: Int) {
    if a == line[1] {
        result.append(choosed.map { String($0+1) }.joined(separator: " "))
        return
    }

    for i in 0..<line[0] {
        choosed[a] = i
        recursive(a: a+1)
    }
}