//
//  TimeScales.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/21/24.
//

enum TimeScales: Int, CaseIterable, Identifiable, CustomStringConvertible {
    case single
    case daily
    case weekly
    case monthly

    var id: Self { self }

    var description: String {
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
