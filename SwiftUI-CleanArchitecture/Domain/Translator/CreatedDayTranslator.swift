//
//  CreatedDayTranslator.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/09.
//

import Foundation

final class CreatedDayTranslator {
    static let shared = CreatedDayTranslator()
    
    private init() {}
    
    func translate(createdAt: Double) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        formatter.dateFormat = "yyyy年M月d日"
        let date = formatter.string(from: Date(timeIntervalSince1970: createdAt))
        
        return date
    }
}
