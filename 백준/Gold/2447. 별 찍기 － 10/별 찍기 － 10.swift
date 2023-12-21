let n = Int(readLine()!)!
let result = recursive(a: n)

print(result.joined(separator: "\n"))

func recursive(a: Int) -> [String] {
    if a == 1 { return ["*"] }

    let unit = recursive(a: a/3)
    let space = String(repeating: " ", count: a/3)
    var newUnit = [String]()

    unit.forEach { newUnit.append($0+$0+$0) }
    unit.forEach { newUnit.append($0+space+$0) }
    unit.forEach { newUnit.append($0+$0+$0) }

    return newUnit
}