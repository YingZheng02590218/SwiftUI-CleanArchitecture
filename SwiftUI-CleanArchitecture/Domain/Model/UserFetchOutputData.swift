//
//  UserFetchOutputData.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/25.
//

import Foundation

struct UserFetchOutputData {
    var uid: String
    var name: String
    var gender: String
    var createdDay: String
    var documentId: String
    
    init(uid: String, name: String, gender: String, createdDay: String, documentId: String) {
        self.uid = uid
        self.name = name
        self.gender = gender
        self.createdDay = createdDay
        self.documentId = documentId
    }
}
