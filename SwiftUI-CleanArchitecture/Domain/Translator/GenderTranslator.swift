//
//  GenderTranslator.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/09.
//

import Foundation

final class GenderTranslator {
    static let shared = GenderTranslator()
    
    private init() {}
    
    func translate(gender: Int) -> String {
        switch gender {
        case 1:
            return "男性"
        case 2:
            return "女性"
        case 3:
            return "選ばない"
        default:
            return ""
        }
    }
}
