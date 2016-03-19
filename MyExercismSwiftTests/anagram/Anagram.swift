struct Anagram {
    let word: String

    func match(comparedWords: [String]) -> [String] {
        let sortedBase = word.lowercaseString.characters.sort()
        var results: [String] = []

        comparedWords.forEach { comparedWord in
            let sortedCompared = comparedWord.lowercaseString.characters.sort()
            if sortedBase == sortedCompared {
                if comparedWord.lowercaseString != word.lowercaseString {
                    results.append(comparedWord)
                }
            }
        }

        return results
    }
}