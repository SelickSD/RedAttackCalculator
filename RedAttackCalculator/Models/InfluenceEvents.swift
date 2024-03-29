//
//  InfluenceEvents.swift
//  RedAttackCalculator
//
//  Created by Сергей Денисенко on 29.03.2024.
//

import Foundation
enum InfluenceEvents {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday

    var nameString: String {
        switch self {
        case .monday:
            return NSLocalizedString("dayOfWeek.monday", comment: "Text displayed day of week name")
        case .tuesday:
            return NSLocalizedString("dayOfWeek.tuesday", comment: "Text displayed day of week name")
        case .wednesday:
            return NSLocalizedString("dayOfWeek.wednesday", comment: "Text displayed day of week name")
        case .thursday:
            return NSLocalizedString("dayOfWeek.thursday", comment: "Text displayed day of week name")
        case .friday:
            return NSLocalizedString("dayOfWeek.friday", comment: "Text displayed day of week name")
        case .saturday:
            return NSLocalizedString("dayOfWeek.saturday", comment: "Text displayed day of week name")
        case .sunday:
            return NSLocalizedString("dayOfWeek.sunday", comment: "Text displayed day of week name")
        }
    }

    var shortName: String {
        switch self {
        case .monday:
            return NSLocalizedString("dayOfWeek.short.monday", comment: "Text displayed day of week short name")
        case .tuesday:
            return NSLocalizedString("dayOfWeek.short.tuesday", comment: "Text displayed day of week short name")
        case .wednesday:
            return NSLocalizedString("dayOfWeek.short.wednesday", comment: "Text displayed day of week short name")
        case .thursday:
            return NSLocalizedString("dayOfWeek.short.thursday", comment: "Text displayed day of week short name")
        case .friday:
            return NSLocalizedString("dayOfWeek.short.friday", comment: "Text displayed day of week short name")
        case .saturday:
            return NSLocalizedString("dayOfWeek.short.saturday", comment: "Text displayed day of week short name")
        case .sunday:
            return NSLocalizedString("dayOfWeek.short.sunday", comment: "Text displayed day of week short name")
        }
    }
}
