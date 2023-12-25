let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = line[0]
let target = line[1]
var choiced = Array(repeating: 0, count: n)
var pointer = -1
var result = 0

recursive(a: 0)
print(result)

func recursive(a: Int) {
    if a == n {
        if pointer > -1 {
            var sum = 0
            for i in 0...pointer {
                sum += choiced[i]
            }
            if sum == target { result += 1 }
        }
        return
    }

    pointer += 1
    choiced[pointer] = array[a]
    recursive(a: a+1)
    pointer -= 1
    recursive(a: a+1)
}