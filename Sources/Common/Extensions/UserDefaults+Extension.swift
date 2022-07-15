//
//  UserDefaults+Extension.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

import Foundation

extension UserDefaults {
    
    static func exists(for key: String) -> Bool {
        !UserDefaults.standard.object(forKey: key).isNil
    }
    
    static func save(string value: String) {
        value == .emptyString
        ? UserDefaults.standard.set(String.savedEmptyString, forKey: .key)
        : UserDefaults.standard.set(value, forKey: .key)
    }
    
    static func getValue(for key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? .emptyString
    }
    
}
