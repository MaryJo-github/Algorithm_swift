let input = readLine()!.split(separator: " ").map { Int($0)! }

print(input.sorted().map { String($0) }.joined(separator: " "))