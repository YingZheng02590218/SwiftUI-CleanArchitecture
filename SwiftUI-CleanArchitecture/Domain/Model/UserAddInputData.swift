//
//  UserAddInputData.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

struct UserAddInputData {
    var name: String
    var gender: Int
    var createdAt: TimeInterval
    
    init(name: String, gender: Int, createdAt: TimeInterval) {
        self.name = name
        self.gender = gender
        self.createdAt = createdAt
    }
}

