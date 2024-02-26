let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var array = Array(repeating: true, count: line[0]+1)
var removeCount = 0
var flag = false

array[0] = false
array[1] = false
for i in 2...line[0] {
    for j in stride(from: i, through: line[0], by: i) {
        if array[j] {
            removeCount += 1
            array[j] = false
            if removeCount == line[1] {
                print(j)
                flag = true
                break
            }
        }
    }
    if flag {
        break
    }
}