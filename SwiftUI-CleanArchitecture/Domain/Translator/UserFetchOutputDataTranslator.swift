//
//  UserFetchOutputDataTranslator.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/09.
//

import Foundation

final class UserFetchOutputDataTranslator {
    static let shared = UserFetchOutputDataTranslator()
    
    private init() {}
    
    func translate(entity: UserFetchOutputEntity) -> UserFetchOutputData {
        let gender = GenderTranslator.shared.translate(gender: entity.gender)
        let createdDay = CreatedDayTranslator.shared.translate(createdAt: entity.createdAt)
        let outputData = UserFetchOutputData(uid: entity.uid, name: entity.name, gender: gender, createdDay: createdDay, documentId: entity.documentId)
        
        return outputData
    }
}
