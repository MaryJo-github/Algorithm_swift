let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted().map { String($0) }
var result = [String]()
var lastIndex = 0

recursive(a: 0, choosed: "")
print(result.joined(separator: "\n"))

func recursive(a: Int, choosed: String) {
    if a == input[1] {
        result.append(choosed)
        return
    }

    var lastValue = ""
    for i in lastIndex..<input[0] {
        guard lastValue != array[i] else { continue }
        lastValue = array[i]
        lastIndex = i
        recursive(a: a+1, choosed: choosed + "\(array[i]) ")
    }
}