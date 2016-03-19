struct Anagram {
    let word: String

    func match(comparedWords: [String]) -> [String] {
        let sortedBase = word.lowercaseString.characters.sort()
        var results: [String] = []

        comparedWords.forEach { comparedWord in
            let sortedCompared = comparedWord.lowercaseString.characters.sort()
            if sortedBase.count == sortedCompared.count {
                let zippedWords = zip(sortedBase, sortedCompared)
                for (n, (c1, c2)) in zippedWords.enumerate() {
                    if n < sortedBase.count {
                        if c1 == c2 {
                            if n == sortedBase.count - 1 {
                                results.append(comparedWord)
                            }
                        } else {
                            break
                        }
                    } else {
                        break
                    }
                }
            }
        }

        return unique(results)
    }

    func unique(list: [String]) -> [String] {
        var result: [String] = []
        list.forEach { string in
            if string.lowercaseString != word.lowercaseString {
                result.append(string)
            }
        }

        return result
    }
}