struct SumOfMultiples {
    static func toLimit(limit: Int, inMultiples multiples: [Int] = [3, 5]) -> Int {
        var total = 0
        (1..<limit).forEach { val in
            total += divide(multiples, val)
        }

        return total
    }

}

func divide(multiples: [Int], _ value: Int) -> Int {
    var returnInt = 0
    var previousAdded = 0

    multiples.forEach { div in
        if div != 0 {
            if value % div == 0 && previousAdded != value {
                returnInt += value
                previousAdded = value
            }
        }
    }

    return returnInt
}
