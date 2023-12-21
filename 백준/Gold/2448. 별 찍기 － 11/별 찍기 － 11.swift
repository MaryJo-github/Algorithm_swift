let n = Int(readLine()!)!
let result = recursive(a: n)

print(result.joined(separator: "\n"))

func recursive(a: Int) -> [String] {
    if a == 3 { return ["  *  "," * * ","*****"] }

    let unit = recursive(a: a/2)
    let space = String(repeating: "   ", count: a/6)
    var newUnit = [String]()

    unit.forEach { newUnit.append(space + $0 + space) }
    unit.forEach { newUnit.append($0 + " " + $0) }

    return newUnit
}