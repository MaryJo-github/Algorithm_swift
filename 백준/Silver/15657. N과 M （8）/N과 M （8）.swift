let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted().map { String($0) }
var result = [String]()
var beforeIndex = 0

recursive(a: 0, choosed: [String]())
print(result.joined(separator: "\n"))

func recursive(a: Int, choosed: [String]) {
    if a == input[1] {
        result.append(choosed.joined(separator: " "))
        return
    }

    for i in beforeIndex..<input[0] {
        beforeIndex = i
        recursive(a: a+1, choosed: choosed + [array[i]])
    }
}