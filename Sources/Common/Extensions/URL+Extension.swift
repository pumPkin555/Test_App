//
//  URL+Extension.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

import Foundation

extension URL {
    
    init(stringLiteral value: String) {
        self = URL(string: value) ?? URL.defaultURL
    }
    
    static var defaultURL: URL = NSURL() as URL
    
}
