struct Hamming {
    static func compute(s1: String, against s2: String) -> Int? {
        var diff = 0

        let char1 = convertStaringToArray(s1)
        let char2 = convertStaringToArray(s2)

        if char1.count != char2.count { return nil }
        for i in 0..<char1.count {
            if char1[i] != char2[i] {
                diff += 1
            }
        }
        return diff
    }
}

private func convertStaringToArray(s: String) -> [Character] {
    var cA: [Character] = []

    for char in s.characters {
        cA.append(char)
    }

    return cA
}
