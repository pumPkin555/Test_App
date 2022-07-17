//
//  RandomStringAPIService.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 14.07.2022.
//

import Combine
import Foundation

final class RandomStringAPIService {
    
    // MARK: - Private
    
    // MARK: Variables
    
    private let baseURL = URL(stringLiteral: .textGenerationURL)
    
}

// MARK: - RandomStringAPIServiceProtocol

extension RandomStringAPIService: RandomStringAPIServiceProtocol {
    
    func fetchData() -> AnyPublisher<RandomStirng, Error> {
        URLSession.shared.dataTaskPublisher(for: baseURL)
            .map { $0.data }
            .decode(type: RandomStirng.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
