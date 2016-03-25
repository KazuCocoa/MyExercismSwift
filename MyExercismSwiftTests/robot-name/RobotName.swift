import Darwin

struct Robot {
    var name: String

    init () {
        name = genRobotName()
    }

    mutating func resetName() {
        name = genRobotName()
    }
}

private func genRobotName() -> String {
    let number = (Int(rand()) % 899) + 100
    return generateRandomLetter() + generateRandomLetter() + String(number)
}

private func generateRandomLetter() -> String {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let letters: [String] = alphabet.characters.map { char in String(char) }
    let randomIn = Int(rand()) % letters.count
    return String(letters[randomIn])
}