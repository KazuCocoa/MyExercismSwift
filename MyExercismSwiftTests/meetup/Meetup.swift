// I should refactor. 

struct MeetupDate: CustomStringConvertible {
    let returnString: String

    init (from: String) {
        self.returnString = from
    }

    var description: String {
        return returnString
    }
}

struct Meetup {

    let year: Int
    let month: Int

    init (year: Int, month: Int) {
        self.year = year
        self.month = month
    }

    func day(weekDay: Int, which schedule: String) -> MeetupDate {
        var s_day: Int = 1

        switch schedule {
        case "1st":
            s_day = first(self.month, weekday: weekDay)
        case "2nd":
            s_day = first(self.month, weekday: weekDay) + 1 * 7
        case "3rd":
            s_day = first(self.month, weekday: weekDay) + 2 * 7
        case "4th":
            s_day = first(self.month, weekday: weekDay) + 3 * 7
        case "last":
            s_day = last(self.month, weekday: weekDay)
        case "teenth":
            s_day = teenth(self.month, weekday: weekDay)
        default:
            s_day = first(self.month, weekday: weekDay)
        }

        let month = self.month < 10 ? "0\(self.month)" : "\(self.month)"
        let day = s_day < 10 ? "0\(s_day)" : "\(s_day)"
        return MeetupDate(from: "\(self.year)-\(month)-\(day)")
    }

    // (Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday:5, Friday:6, Saturday:7)
    private func first(month: Int, weekday: Int) -> Int {
        var weekDay: [Int: Int] = [0: 0]
        switch month {
        case let m where m == 4 || m == 7:
            weekDay = [2: 1, 3: 2, 4: 3, 5: 4, 6: 5, 7: 6, 1: 7]
        case let m where m == 9 || m == 12:
            weekDay = [2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 1: 1]
        case 6:
            weekDay = [2: 3, 3: 4, 4: 5, 5: 6, 6: 7, 7: 1, 1: 2]
        case let m where m == 2 || m == 3 || m == 11:
            weekDay = [2: 4, 3: 5, 4: 6, 5: 7, 6: 1, 7: 2, 1: 3]
        case 8:
            weekDay = [2: 5, 3: 6, 4: 7, 5: 1, 6: 2, 7: 3, 1: 4]
        case 5:
            weekDay = [2: 6, 3: 7, 4: 1, 5: 2, 6: 3, 7: 4, 1: 5]
        case let m where m == 1 || m == 10:
            weekDay = [2: 7, 3: 1, 4: 2, 5: 3, 6: 4, 7: 5, 1: 6]
        default:
            weekDay = [2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 1: 1]
        }

        if weekday < 1 || weekday > 7 {
            return weekDay[1]!
        } else {
            return weekDay[weekday]!
        }
    }

    private func teenth(month: Int, weekday: Int) -> Int {
        var weekDay: [Int: Int] = [0: 0]
        switch month {
        case 5:
            weekDay = [2: 13, 3: 14, 4: 15, 5: 16, 6: 17, 7: 18, 8: 19]
        case let m where m == 1 || m == 10:
            weekDay = [2: 14, 3: 15, 4: 16, 5: 17, 6: 18, 7: 19, 1: 13]
        case let m where m == 4 || m == 7 || m == 12:
            weekDay = [2: 15, 3: 16, 4: 17, 5: 18, 6: 19, 7: 13, 1: 14]
        case 9:
            weekDay = [2: 16, 3: 17, 4: 18, 5: 19, 6: 13, 7: 14, 1: 15]
        case 6:
            weekDay = [2: 17, 3: 18, 4: 19, 5: 13, 6: 14, 7: 15, 1: 16]
        case let m where m == 2 || m == 3 || m == 11:
            weekDay = [2: 18, 3: 19, 4: 13, 5: 14, 6: 15, 7: 16, 1: 17]
        case 8:
            weekDay = [2: 19, 3: 13, 4: 14, 5: 15, 6: 16, 7: 17, 1: 18]
        default:
            weekDay = [2: 14, 3: 15, 4: 16, 5: 17, 6: 18, 7: 19, 1: 13]
        }

        if weekday < 1 || weekday > 7 {
            return weekDay[1]!
        } else {
            return weekDay[weekday]!
        }
    }

    private func last(month: Int, weekday: Int) -> Int {
        var weekDay: [Int: Int] = [0: 0]
        switch month {
        case let m where m == 1 || m == 10:
            weekDay = [2: 28, 3: 29, 4: 30, 5: 31, 6: 25, 7: 26, 1: 27]
        case 2:
            let n = 28 + (1 / (self.year % 4 + 1)) * (1 - 1 / (self.year % 100 + 1)) + (1 / (self.year % 400 + 1))
            if n == 29 {
                weekDay = [2: 27, 3: 28, 4: 29, 5: 23, 6: 24, 7: 25, 1: 26]
            } else {
                weekDay = [2: 25, 3: 26, 4: 27, 5: 28, 6: 22, 7: 23, 1: 24]
            }
        case 3:
            weekDay = [2: 25, 3: 26, 4: 27, 5: 28, 6: 29, 7: 30, 1: 31]
        case 4:
            weekDay = [2: 29, 3: 30, 4: 24, 5: 25, 6: 26, 7: 27, 1: 28]
        case 5:
            weekDay = [2: 27, 3: 28, 4: 29, 5: 30, 6: 31, 7: 25, 1: 26]
        case 6:
            weekDay = [2: 24, 3: 25, 4: 26, 5: 27, 6: 28, 7: 29, 1: 30]
        case 7:
            weekDay = [2: 29, 3: 30, 4: 31, 5: 25, 6: 26, 7: 27, 1: 28]
        case 8:
            weekDay = [2: 26, 3: 27, 4: 28, 5: 29, 6: 30, 7: 31, 1: 25]
        case 9:
            weekDay = [2: 30, 3: 24, 4: 25, 5: 26, 6: 27, 7: 28, 1: 29]
        case 11:
            weekDay = [2: 25, 3: 26, 4: 27, 5: 28, 6: 29, 7: 30, 1: 24]
        case 12:
            weekDay = [2: 30, 3: 31, 4: 25, 5: 26, 6: 27, 7: 28, 1: 29]
        default:
            weekDay = [2: 25, 3: 26, 4: 27, 5: 28, 6: 22, 7: 23, 1: 24]
        }

        if weekday < 1 || weekday > 7 {
            return weekDay[1]!
        } else {
            return weekDay[weekday]!
        }
    }


}