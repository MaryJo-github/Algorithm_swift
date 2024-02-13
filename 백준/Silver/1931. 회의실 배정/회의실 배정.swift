let n = Int(readLine()!)!
var meetings = [(Int, Int)]()
var end = 0
var result = 0

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    meetings.append((line[0], line[1]))
}

meetings.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1

    }
}

for meeting in meetings {
    if meeting.0 >= end {
        result += 1
        end = meeting.1
    }
}

print(result)