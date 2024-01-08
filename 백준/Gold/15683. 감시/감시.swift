let size = readLine()!.split(separator: " ").compactMap { Int($0) }
var office = [[Int]]()
var cctvs = [(Int, Int, Int)]()
var result = size[0] * size[1]

for row in 0..<size[0] {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    office.append(line)
    for (column, value) in line.enumerated() {
        if value > 0, value < 6 {
            cctvs.append((value, row, column))
        }
    }
}

recursive(a: 0, office: office)
print(result)

func recursive(a: Int, office: [[Int]]) {
    if a == cctvs.count {
        var count = 0

        for i in 0..<size[0] {
            for j in 0..<size[1] {
                if office[i][j] == 0 {
                    count += 1
                }
            }
        }

        result = min(result, count)
        return
    }

    var temp = office

    switch cctvs[a].0 {
        case 1:
        for d in direction.allCases {
            temp = oneSight(d, (cctvs[a].1, cctvs[a].2), office)
            recursive(a: a+1, office: temp)
        }
        case 2:
        temp = oneSight(direction.L, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.R, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)

        temp = oneSight(direction.U, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.D, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)
        case 3:
        temp = oneSight(direction.U, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.R, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)

        temp = oneSight(direction.R, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.D, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)

        temp = oneSight(direction.D, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.L, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)

        temp = oneSight(direction.L, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.U, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)
        case 4:
        temp = oneSight(direction.L, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.U, (cctvs[a].1, cctvs[a].2), temp)
        temp = oneSight(direction.R, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)

        temp = oneSight(direction.U, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.R, (cctvs[a].1, cctvs[a].2), temp)
        temp = oneSight(direction.D, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)

        temp = oneSight(direction.R, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.D, (cctvs[a].1, cctvs[a].2), temp)
        temp = oneSight(direction.L, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)

        temp = oneSight(direction.D, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.L, (cctvs[a].1, cctvs[a].2), temp)
        temp = oneSight(direction.U, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)
        case 5:
        temp = oneSight(direction.L, (cctvs[a].1, cctvs[a].2), office)
        temp = oneSight(direction.R, (cctvs[a].1, cctvs[a].2), temp)
        temp = oneSight(direction.U, (cctvs[a].1, cctvs[a].2), temp)
        temp = oneSight(direction.D, (cctvs[a].1, cctvs[a].2), temp)
        recursive(a: a+1, office: temp)
        default:
        return
    }
}

func oneSight(_ d: direction, _ location: (Int, Int), _ office: [[Int]]) -> [[Int]] {
    var newOffice = office

    switch d {
        case direction.R:
        for i in location.1..<size[1] {
            guard office[location.0][i] != 6 else { break }
            if office[location.0][i] == 0 {
                newOffice[location.0][i] = 7
            }
        }
        case direction.L:
        for i in stride(from: location.1-1, through: 0, by: -1) {
            guard office[location.0][i] != 6 else { break }
            if office[location.0][i] == 0 {
                newOffice[location.0][i] = 7
            }
        }
        case direction.U:
        for i in stride(from: location.0-1, through: 0, by: -1) {
            guard office[i][location.1] != 6 else { break }
            if office[i][location.1] == 0 {
                newOffice[i][location.1] = 7
            }
        }
        case direction.D:
        for i in location.0..<size[0] {
            guard office[i][location.1] != 6 else { break }
            if office[i][location.1] == 0 {
                newOffice[i][location.1] = 7
            }
        }
    }

    return newOffice
}

enum direction: String, CaseIterable {
    case R, L, U, D
}