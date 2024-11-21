//
//  TimeScales.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/21/24.
//

enum TimeScales: Int {
    case single
    case daily
    case weekly
    case monthly
}

extension TimeScales {
    func toString() -> String {
        switch self {
            case .single:
                return "Never"
            case .daily:
                return "Daily"
            case .weekly:
                return "Weekly"
            case .monthly:
                return "Monthly"
                }
    }
}
