let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var count = 0

print(recursive(n: line[0], x: line[1], y: line[2]))

func recursive(n: Int, x: Int, y: Int) -> Int {
    if n == 0 { return 0 }

    let unit = 1<<(n-1)
    if x < unit && y < unit {
        return recursive(n: n-1, x: x, y: y)
    } else if x < unit && y >= unit {
        return unit * unit + recursive(n: n-1, x: x, y: y-unit)
    } else if x >= unit && y < unit {
        return 2 * unit * unit + recursive(n: n-1, x: x-unit, y: y)
    } else {
        return 3 * unit * unit + recursive(n: n-1, x: x-unit, y: y-unit)
    }
}