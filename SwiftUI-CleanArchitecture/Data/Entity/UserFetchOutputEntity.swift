//
//  UserFetchOutputEntity.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/09.
//

import Foundation

struct UserFetchOutputEntity {
    var uid: String
    var name: String
    var gender: Int
    var createdAt: Double
    var documentId: String
    
    init(uid: String, name: String, gender: Int, createdAt: Double, documentId: String) {
        self.uid = uid
        self.name = name
        self.gender = gender
        self.createdAt = createdAt
        self.documentId = documentId
    }
}
