//
//  MVCCountoryModel.swift
//  MVCSampleApp
//
//  Created by 尾原徳泰 on 2021/06/02.
//

import Foundation

enum MVCCountryModel: CaseIterable {
    case america
    case japan
    case chaina
    case france
    
    var name: String {
        switch self {
        case .america:
            return "アメリカ"
        case .japan:
            return "日本"
        case .chaina:
            return "中国"
        case .france:
            return "フランス"
        }
    }
    
    var imageName: String {
        switch self {
        case .america:
            return "america"
        case .japan:
            return "japan"
        case .chaina:
            return "chaina"
        case .france:
            return "france"
        }
    }
    
    var moneyRatio: Double {
        switch self {
        case .america:
            return 0.01
        case .japan:
            return 1
        case .chaina:
            return 0.5
        case .france:
            return 0.2
        }
    }
}

