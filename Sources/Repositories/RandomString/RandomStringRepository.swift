//
//  RandomStringRepository.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 14.07.2022.
//

import Combine
import Foundation

final class RandomStringRepository {
    
    // MARK: - Private
    
    // MARK: Variables
    
    private let apiService: RandomStringAPIServiceProtocol
    
    // MARK: - Initialization
    
    init(apiService: RandomStringAPIServiceProtocol = RandomStringAPIService()) {
        self.apiService = apiService
    }
    
}

// MARK: - RandomStringPerositoryProtocol

extension RandomStringRepository: RandomStringPerositoryProtocol {
    
    func fetchData(completion: @escaping (AnyPublisher<RandomStirng, Error>) -> Void) {
        completion(apiService.fetchData())
    }
    
}

