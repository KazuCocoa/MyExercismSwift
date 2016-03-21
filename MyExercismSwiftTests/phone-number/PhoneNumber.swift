import Foundation

struct PhoneNumber: CustomStringConvertible {
    var number: String = ""
    var areaCode: String = ""

    let badNumber: String = "0000000000"

    init (_ phoneNumber: String) {
        self.number = trim(format(phoneNumber))
        self.areaCode = getArea(self.number)
    }

    var description: String {
        let prefix = (number as NSString).substringWithRange(NSRange(location: 3, length: 3))
        let final = (number as NSString).substringFromIndex(6)

        return "(\(areaCode)) \(prefix)-\(final)"
    }

    private func trim(phoneNumber: String) -> String {
        let phoneNumbercount = phoneNumber.characters.count
        if phoneNumbercount == 11 && phoneNumber.characters.first == "1" {
            return (phoneNumber as NSString).substringFromIndex(1)
        } else if phoneNumbercount == 10 {
            return phoneNumber
        } else {
            return self.badNumber
        }
    }

    private func format(startingNumber: String) -> String {
        let pattern = "[0-9]+"
        let regex = try! NSRegularExpression(pattern: pattern, options: .CaseInsensitive)

        let matches = regex.matchesInString(startingNumber, options: [], range: NSMakeRange(0, startingNumber.characters.count))

        var results: [String] = []
        matches.forEach { match in
            results.append((startingNumber as NSString).substringWithRange(match.rangeAtIndex(0)))
        }

        return results.joinWithSeparator("")
    }

    private func getArea(formatedPhoneNumber: String) -> String {
        return (formatedPhoneNumber as NSString).substringToIndex(3)
    }
}