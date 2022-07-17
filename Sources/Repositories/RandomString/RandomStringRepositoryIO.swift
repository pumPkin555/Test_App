//
//  RandomStringRepositoryIO.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

import Combine

protocol RandomStringPerositoryProtocol {
    
    func fetchData(completion: @escaping (AnyPublisher<RandomStirng, Error>) -> Void)
    
}
