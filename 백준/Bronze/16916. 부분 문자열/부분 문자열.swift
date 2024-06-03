let s = readLine()!.map { String($0) }
let p = readLine()!.map { String($0) }
let pi = getPiTable(pattern: s)
var j = 0
var isPartial = false

for i in 0..<s.count {
    // 중간에 문자가 서로 다르다면, 이전으로 돌아와 다시 진행
    while j > 0 && s[i] != p[j] {
        j = pi[j-1]
    }

    // 문자가 같으면 다음꺼 비교
    if s[i] == p[j] { j += 1 }

    // 특정 문자열의 길이만큼 같다면, 해당 문자열은 겹친다고 판단
    if j == p.count {
        isPartial = true
        break
    }
}

if isPartial {
    print(1)
} else {
    print(0)
}

func getPiTable(pattern: [String]) -> [Int] {
    var pi = Array(repeating: 0, count: pattern.count)
    var j = 0

    for i in 1..<pattern.count {
        // 일치하지 않는 부분부터 다시 탐색
        while j > 0 && pattern[i] != pattern[j] {
            j = pi[j-1]
        }

        // 일치한다면, 다음 문자도 일치하는지 확인
        if pattern[i] == pattern[j] {
            j += 1
            pi[i] = j
        }
    }

    return pi
}