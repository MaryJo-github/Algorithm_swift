import Foundation

func solution(_ quiz:[String]) -> [String] {
    var result: [String] = []
    for q in quiz {
        if isCorrectFormula(q) {
            result.append("O")
        } else {
            result.append("X")
        }
    }
    return result
}

func isCorrectFormula(_ quiz: String) -> Bool {
    let quiz = quiz.components(separatedBy: " ")
    let sign = quiz[1] == "-" ? -1 : 1

    return Int(quiz[0])! + Int(quiz[2])! * sign == Int(quiz[4])!
}
