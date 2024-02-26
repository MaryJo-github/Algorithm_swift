var result = ""
var count = 1

while let line = readLine(),
line != "0 0 0" {
    let numbers = line.split(separator: " ").compactMap { Int($0) }

    result += "Case \(count): \(calculate(l: numbers[0], p: numbers[1], v: numbers[2]))\n"
    count += 1
}

print(result)

func calculate(l: Int, p: Int, v: Int) -> Int {
    let rest = v % p
    return (v / p) * l + (rest < l ? rest : l)
}