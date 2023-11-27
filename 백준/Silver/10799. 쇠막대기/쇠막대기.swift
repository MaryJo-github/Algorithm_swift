let line = readLine()!
var stack = [Character]()
var result = 0
var prevCh = Character(" ")

for ch in line {
    switch ch {
        case "(":
        stack.append(ch)
        case ")":
        stack.removeLast()
        if prevCh == "(" {
            result += stack.count
        } else {
            result += 1
        }
        default:
        continue
    }
    prevCh = ch
}

print(result)