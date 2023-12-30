let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted().map { String($0) }
var visited = Array(repeating: false, count: input[0])
var result = [String]()

recursive(a: 0, choosed: [String]())
print(result.joined(separator: "\n"))

func recursive(a: Int, choosed: [String]) {
    if a == input[1] {
        let temp = choosed.joined(separator: " ")
        result.append(temp)
        return
    }

    var lastValue = ""
    for i in 0..<input[0] {
        guard visited[i] == false,
        lastValue != array[i] else { continue }
        visited[i] = true
        lastValue = array[i]
        recursive(a: a+1, choosed: choosed + [array[i]])
        visited[i] = false
    }
}