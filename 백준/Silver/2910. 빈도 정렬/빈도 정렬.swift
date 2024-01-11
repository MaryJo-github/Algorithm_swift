let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let array = readLine()!.split(separator: " ").compactMap { String($0) }
var dic = [String: (Int, Int)]()
var result = ""

for i in 0..<line[0] {
    dic[array[i], default: (0, i)].0 += 1
}

dic.sorted {
    $0.value.0 == $1.value.0 ? $0.value.1 < $1.value.1 : $0.value.0 > $1.value.0
}.forEach {
    for _ in 0..<$0.value.0 {
        result += "\($0.key) "
    }
}
print(result)