let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let temp = (numbers[2]-numbers[0])%(numbers[0]-numbers[1]) == 0 ? (numbers[2]-numbers[0])/(numbers[0]-numbers[1]) : (numbers[2]-numbers[0])/(numbers[0]-numbers[1]) + 1
print(temp+1)