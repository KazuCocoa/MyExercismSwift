import Foundation

private extension String {
    subscript (range: Range<Int>) -> String {
        get {
            let start = startIndex.advancedBy(range.startIndex)
            let end = start.advancedBy(range.endIndex - range.startIndex)

            return self[Range(start: start, end: end)]
        }
    }

    var onlyDigits: String {
        return String(characters.filter { $0.isDigit })
    }
}

private extension Character {
    var isDigit: Bool {
        return "0123456789".characters.contains(self)
    }
}

struct PhoneNumber: CustomStringConvertible {
    var number: String

    let badNumber: String = "0000000000"

    init (_ phoneNumber: String) {
        let digits = phoneNumber.onlyDigits

        switch digits.characters.count {
        case 10:
            number = digits
        case 11 where digits.hasPrefix("1"):
            number = digits[1...10]
        default:
            number = badNumber
        }
    }

    var areaCode: String {
        return number[0...2]
    }

    var description: String {
        let prefix = (number as NSString).substringWithRange(NSRange(location: 3, length: 3))
        let final = (number as NSString).substringFromIndex(6)

        return "(\(areaCode)) \(prefix)-\(final)"
    }
}