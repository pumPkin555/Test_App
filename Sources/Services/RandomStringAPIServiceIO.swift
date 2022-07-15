//
//  RandomStringAPIServiceIO.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

protocol RandomStringAPIServiceProtocol {
    
    func fetchData(completion: @escaping (Result<RandomStirng, RandomStringError>) -> Void)
    
}
