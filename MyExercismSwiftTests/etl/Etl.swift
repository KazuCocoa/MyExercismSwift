struct ETL {
    static func transform(olds: [Int: Array<String>]) -> [String: Int] {
        var trans = [String: Int]()
        olds.forEach { old in
            old.1.forEach { string in
                if let count = trans[string.lowercaseString] {
                    trans[string.lowercaseString] = count + old.0
                } else {
                    trans[string.lowercaseString] = old.0
                }
            }
        }

        return trans
    }
}