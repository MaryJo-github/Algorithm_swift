let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").sorted()
var result = [String]()
var lastIndex = 0

recursive(a: 0, choosed: "", moum: 1, jaum: 2)
print(result.joined(separator: "\n"))

func recursive(a: Int, choosed: String, moum: Int, jaum: Int) {
    if a == input[0] {
        if moum <= 0 && jaum <= 0 {
            result.append(choosed)
        }
        return
    }

    for i in lastIndex..<input[1] {
        lastIndex = i + 1
        if ["a", "e", "i", "o", "u"].contains(array[i]) {
            recursive(a: a+1, choosed: choosed + "\(array[i])", moum: moum-1, jaum: jaum)
        } else {
            recursive(a: a+1, choosed: choosed + "\(array[i])", moum: moum, jaum: jaum-1)
        }
    }
}