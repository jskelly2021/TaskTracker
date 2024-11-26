//
//  Days.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
//

enum Days: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday

    var id: Self { self }

    var description: String {
        switch self {
        case .Sunday:
            return "Sunday"
        case .Monday:
            return "Monday"
        case .Tuesday:
            return "Tuesday"
        case .Wednesday:
            return "Wednesday"
        case .Thursday:
            return "Thursday"
        case .Friday:
            return "Friday"
        case .Saturday:
            return "Saturday"
        }
    }

    var abbrieviate: String {
        switch self {
        case .Sunday:
            return "S"
        case .Monday:
            return "M"
        case .Tuesday:
            return "T"
        case .Wednesday:
            return "W"
        case .Thursday:
            return "T"
        case .Friday:
            return "F"
        case .Saturday:
            return "S"
        }
    }
}
