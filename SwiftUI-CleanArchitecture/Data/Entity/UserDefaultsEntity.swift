//
//  UserDefaultsEntity.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/15.
//

import Foundation

final class UserDefaultsEntity {
    static let shared = UserDefaultsEntity()
    
    private init() {}
    
    private enum DefaultsKey: String {
        case isUserDataSaved
    }
    
    private var defaults: UserDefaults {
        UserDefaults.standard
    }
    
    var isUserDataSaved: Bool {
        get {
            defaults.bool(forKey: DefaultsKey.isUserDataSaved.rawValue)
        } set {
            defaults.set(newValue, forKey: DefaultsKey.isUserDataSaved.rawValue)
        }
    }
}
