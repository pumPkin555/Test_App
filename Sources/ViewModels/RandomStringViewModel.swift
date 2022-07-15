//
//  TextInputViewModel.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 14.07.2022.
//

import Foundation

final class RandomStringViewModel: ObservableObject {
    
    // MARK: - Published
    
    // MARK: Variables
    
    @Published var randomString: String = .emptyString
    
    // MARK: - Private
    
    // MARK: Variables
    
    private let randomStirngRepository: RandomStringPerositoryProtocol
    
    // MARK: - Initialization
    
    init(randomStirngRepository: RandomStringPerositoryProtocol = RandomStringRepository()) {
        self.randomStirngRepository = randomStirngRepository
    }
    
    // MARK: - Public functions
    
    func onAppear() {
        if UserDefaults.exists(for: .key) {
            self.randomString = UserDefaults.getValue(for: .key)
        } else {
            fetchData()
        }
    }
    
    func saveString(_ value: String) {
        UserDefaults.save(string: value)
    }
    
    func fetchData() {
        randomStirngRepository.fetchData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.randomString = model.activity
                case .failure:
                    self.randomString = .emptyString
                }
            }
        }
    }
    
}
