let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = 0

recursive(a: 0, sum: 0)
line[1] == 0 ? print(result-1) : print(result)

func recursive(a: Int, sum: Int) {
    if a == line[0] {
        if sum == line[1] { result += 1 }
        return
    }

    recursive(a: a+1, sum: sum)
    recursive(a: a+1, sum: sum+array[a])
}