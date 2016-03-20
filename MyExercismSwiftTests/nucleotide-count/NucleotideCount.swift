enum Nucleobase: Character {
    case Adenine = "A", Cytosine = "C", Guanine = "G", Thymine = "T"
}

struct DNA {

    var nucleobaseCount: [Nucleobase: Int] = [.Adenine: 0, .Cytosine: 0, .Guanine: 0, .Thymine: 0]

    init?(strand: String) {
        var validDna: Bool = true
        strand.characters.forEach { string in
            if let possible = Nucleobase(rawValue: string) {
                nucleobaseCount[possible]! += 1
            } else {
                validDna = false
            }
        }

        if validDna == false { return nil }
    }

    func count(dna: Character) -> Int {
        return nucleobaseCount[Nucleobase(rawValue: dna)!]!
    }

    func counts() -> [String: Int] {
        var result: [String: Int] = [:]

        nucleobaseCount.forEach { (key, value) in
            result[String(key.rawValue)] = value
        }

        return result
    }
}