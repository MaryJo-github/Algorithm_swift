let input = readLine()!.split(separator: " ").compactMap { Int($0) }

print(recursive(x: input[1]))

func recursive(x: Int) -> Int {
    if x == 0 { return 1 }

    var result = recursive(x: x / 2)
    result = (result * result) % input[2]

    if x % 2 == 1 {
        result = (result * input[0]) % input[2]
    }

    return result
}