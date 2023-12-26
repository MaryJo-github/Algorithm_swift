let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = [String]()

recursive(a: 0, choosed: [Int]())
print(result.joined(separator: "\n"))

func recursive(a: Int, choosed: [Int]) {
    if a == line[1] {
        result.append(choosed.map { String($0+1) }.joined(separator: " "))
        return
    }

    let start = a == 0 ? 0 : choosed.last!
    for i in start..<line[0] {
        recursive(a: a+1, choosed: choosed + [i])
    }
}