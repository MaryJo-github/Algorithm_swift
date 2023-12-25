let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = [String]()
var isUsed = Array(repeating: false, count: line[0])
var choosed = Array(repeating: 0, count: line[1])

recursive(a: 0)
print(result.joined(separator: "\n"))

func recursive(a: Int) {
    if a == line[1] {
        var temp = ""
        for i in 0..<line[1] {
            temp += "\(choosed[i]+1) "
        }
        result.append(temp)
        return
    }
    let start = a == 0 ? 0 : choosed[a-1]
    for i in start..<line[0] {
        guard isUsed[i] == false else { continue }
        isUsed[i] = true
        choosed[a] = i
        recursive(a: a+1)
        isUsed[i] = false
    }
}