struct ETL {
    static func transform(olds: [Int: [String]]) -> [String: Int] {
        var trans = [String: Int]()
        olds.forEach { old in
            old.1.forEach { string in
                trans[string.lowercaseString] = old.0
            }
        }

        return trans
    }
}