//
//  RandomStringAPIService.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 14.07.2022.
//

import Foundation

final class RandomStringAPIService: RandomStringAPIServiceProtocol {
    
    private let baseURL = URL(stringLiteral: .textGenerationURL)
    
    func fetchData(completion: @escaping (Result<RandomStirng, RandomStringError>) -> Void) {
        
        let url = URL(stringLiteral: .textGenerationURL)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                return
            }

            do {
                let result = try JSONDecoder().decode(RandomStirng.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.invalidData))
            }

        }.resume()
    }
    
}
