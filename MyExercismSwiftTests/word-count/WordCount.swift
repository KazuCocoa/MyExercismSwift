struct WordCount {
    let words: String

    func count() -> [String: Int] {
        var dict = [String: Int]()
        let splitedArray = splitStringToArray(words)
        splitedArray.forEach { string in
            if let count = dict[string.lowercaseString] {
                dict[string.lowercaseString] = count + 1
            } else {
                dict[string.lowercaseString] = 1
            }
        }
        return dict
    }

    private func splitStringToArray(string: String) -> [String] {
        return string.characters.split(isSeparator: { splitAt($0) }).map { String($0) }
    }

    private func splitAt(charToCompare: Character, charToSplitAt: String = " :!&$%^&,") -> Bool {
        for each in charToSplitAt.characters {
            if each == charToCompare {
                return true
            }
        }
        return false
    }
}
