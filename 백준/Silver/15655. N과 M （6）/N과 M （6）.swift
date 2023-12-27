let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var result = [String]()
var lastIndex = 0

recursive(a: 0, choosed: [Int]())
print(result.joined(separator: "\n"))

func recursive(a: Int, choosed: [Int]) {
    if a == input[1] {
        result.append(choosed.map { String($0) }.joined(separator: " "))
        return
    }

    for i in lastIndex..<input[0] {
        lastIndex = i+1
        recursive(a: a+1, choosed: choosed + [array[i]])
    }
}