let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var isUsed = Array(repeating: false, count: input[0])
var result = [String]()

recursive(a: 0, choosed: [Int]())
print(result.joined(separator: "\n"))

func recursive(a: Int, choosed: [Int]) {
    if a == input[1] {
        result.append(choosed.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 0..<input[0] {
        guard isUsed[i] == false else { continue }
        isUsed[i] = true
        recursive(a: a+1, choosed: choosed + [array[i]])
        isUsed[i] = false
    }
}