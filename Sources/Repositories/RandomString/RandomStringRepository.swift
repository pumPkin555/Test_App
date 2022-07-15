//
//  RandomStringRepository.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 14.07.2022.
//

final class RandomStringRepository: RandomStringPerositoryProtocol {
    
    // MARK: - Private
    
    // MARK: Variables
    
    private let apiService: RandomStringAPIServiceProtocol
    
    // MARK: - Initialization
    
    init(apiService: RandomStringAPIServiceProtocol = RandomStringAPIService()) {
        self.apiService = apiService
    }
    
    // MARK: - Public functions
    
    func fetchData(completion: @escaping (Result<RandomStirng, RandomStringError>) -> Void) {
        apiService.fetchData(completion: completion)
    }
    
}

