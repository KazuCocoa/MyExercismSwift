extension Array {
    func accumulate<S>(fn: (Element) -> S) -> [S] {
        var acc: [S] = [S]()
        self.forEach { item in
            acc.append(fn(item))
        }
        return acc
    }
}