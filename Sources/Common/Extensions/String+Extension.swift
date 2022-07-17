//
//  String+Extension.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

import Foundation

extension String {
    
    static let emptyString = ""
    static let errorText = "Bad request. \nPlease try again."
    
}

// MARK: - RandomStringAPIService

extension String {
    
    static let textGenerationURL = "http://www.boredapi.com/api/activity/"
    
}

// MARK: - UserDefaults

extension String {
    
    static let key = "UserDefaultsKey"
    static let savedEmptyString = "You saved an empty string."
    
}
