let line = readLine()!
var stack = [Character]()
var result = 0
var prevCh = Character(" ")

for ch in line {
    switch ch {
        case "(", "[":
        stack.append(ch)
        case ")":
        if stack.last == "(" {
            stack.removeLast()
            if prevCh == "(" {
                result += 2 * calculate(stack: stack)
            }
        } else {
            stack.append(ch)
        }
        case "]":
        if stack.last == "[" {
            stack.removeLast()
            if prevCh == "[" {
                result += 3 * calculate(stack: stack)
            }
        } else {
            stack.append(ch)
        }
        default:
        continue
    }
    prevCh = ch
}

print(stack.isEmpty ? result : 0)

func calculate(stack: [Character]) -> Int {
    var r = 1

    for c in stack {
        switch c {
            case "(":
            r *= 2
            case "[":
            r *= 3
            default:
            continue
        }
    }

    return r
}