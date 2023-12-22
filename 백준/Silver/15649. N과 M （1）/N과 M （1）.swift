let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var isUsed = Array(repeating: false, count: input[0])
var choosed = Array(1...10)
var result = [String]()

recursive(k: 0)
print(result.joined(separator: "\n"))

func recursive(k: Int) {
    if k == input[1] {
        var temp = ""
        for i in 0..<input[1] {
            temp += "\(choosed[i]+1) "
        }
        result.append(temp)
        return
    }

    for i in 0..<input[0] {
        if isUsed[i] == false {
            choosed[k] = i
            isUsed[i] = true
            recursive(k: k+1)
            isUsed[i] = false
        }
    }
}