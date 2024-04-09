//
//  InfluenceEvents.swift
//  RedAttackCalculator
//
//  Created by Сергей Денисенко on 29.03.2024.
//

import Foundation
enum InfluenceEvents {
    case plain
    case swamp
    case mountains
    case desert
    case river
    case volga
    case lake
    case city
    case redCity
    case sourceOfSupply
    case freeTerritory
    case railway
    case cossackCircle
    case occupationLine

    var nameString: String {
        switch self {
        case .plain:
            return "Равнина"
        case .swamp:
            return "Болото"
        case .mountains:
            return "Горы"
        case .desert:
            return "Пустыня"
        case .river:
            return "Река"
        case .volga:
            return "Волга"
        case .lake:
            return "Озеро"
        case .city:
            return "Город"
        case .redCity:
            return "Красный город"
        case .sourceOfSupply:
            return "Источник снабжения"
        case .freeTerritory:
            return "Вольная территория"
        case .railway:
            return "Железная дорога"
        case .cossackCircle:
            return "Казачий круг"
        case .occupationLine:
            return "Оккупационная линия"
        }
    }

    var influence: Int? {
        switch self {
        case .plain:
            return 0
        case .swamp:
            return 0
        case .mountains:
            return 1
        case .desert:
            return nil
        case .river:
            return 1
        case .volga:
            return 1
        case .lake:
            return nil
        case .city:
            return 1
        case .redCity:
            return 1
        case .sourceOfSupply:
            return 0
        case .freeTerritory:
            return 0
        case .railway:
            return 0
        case .cossackCircle:
            return 0
        case .occupationLine:
            return 0
        }
    }

    var event: String? {
        switch self {
        case .desert:
            return "Запрещено"
        case .river:
            return "Кроме атак из гекса вдоль той же самой реки либо вдоль как минимум 2 из 3 линий рек, проходящих в гексе обороняющегося"
        case .volga:
            return "Кроме атак из гекса вдоль той же самой реки либо вдоль как минимум 2 из 3 линий рек, проходящих в гексе обороняющегося"
        case .lake:
            return "Запрещено"
        case .redCity:
            return "Только если красные в обороне"
        case .railway:
            return "Можно разместить / использовать бронепоезд"
        default:
            return nil
        }
    }
}
