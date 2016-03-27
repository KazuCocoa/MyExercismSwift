enum Allergy: UInt {
    case Eggs = 1
    case Peanuts = 2
    case Shellfish = 4
    case Strawberries = 8
    case Tomatoes = 16
    case Chocolate = 32
    case Pollen = 64
    case Cats = 128
}


struct Allergies {
    let allerginScore: UInt

    init(_ score: UInt) {
        allerginScore = UInt(score)
    }

    func hasAllergy(allergy: Allergy) -> Bool {
        return allergy.rawValue & allerginScore == allergy.rawValue ? true : false
    }
}