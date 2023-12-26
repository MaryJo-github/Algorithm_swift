let target = 6
var result = [String]()

while let line = readLine(), line != "0" {
    var array = line.split(separator: " ").compactMap { Int($0) }
    array.removeFirst()
    solution(array: array)
    result.append("")
}

result.removeLast()
print(result.joined(separator: "\n"))

func solution(array: [Int]) {
    var choosed = Array(repeating: 0, count: target)
    var beforeIndex = 0

    recursive(a: 0)

    func recursive(a: Int) {
        if a == target {
            result.append(choosed.map { String($0) }.joined(separator: " "))
            return
        }

        for i in beforeIndex..<array.count-(target-a-1) {
            choosed[a] = array[i]
            beforeIndex = i+1
            recursive(a: a+1)
        }
    }
}