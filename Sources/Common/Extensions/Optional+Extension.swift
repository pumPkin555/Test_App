//
//  Optional+Extension.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

extension Optional {
    
    var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
    
}
