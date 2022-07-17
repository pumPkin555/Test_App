//
//  RandomStringAPIServiceIO.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

import Combine

protocol RandomStringAPIServiceProtocol {
    
    func fetchData() -> AnyPublisher<RandomStirng, Error>
    
}
