enum NumberClassification {
    case Perfect, Deficient, Abundant
}

struct NumberClassifier {
    let number: Int

    var classification: NumberClassification {
        switch cdSum(number) {
        case let sum where sum == number:
            return .Perfect
        case let sum where sum < number:
            return .Deficient
        default:
            return .Abundant
        }
    }

    func cdSum(number: Int) -> Int {
        return Array(1..<(number - 1)).filter({ number % $0 == 0 }).reduce(0, combine: +)
    }
}