//
//  TextInputViewModel.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 14.07.2022.
//

import Combine
import Foundation

final class RandomStringViewModel: ObservableObject {
    
    // MARK: - Published
    
    // MARK: Variables
    
    @Published var resultMessage: String = .emptyString
    
    // MARK: - Private
    
    // MARK: Variables
    
    private let randomStirngRepository: RandomStringPerositoryProtocol
    private var cancellable: AnyCancellable?

    // MARK: - Initialization
    
    init(randomStirngRepository: RandomStringPerositoryProtocol = RandomStringRepository()) {
        self.randomStirngRepository = randomStirngRepository
    }
    
    // MARK: - Public functions
    
    func onAppear() {
        if UserDefaults.exists(for: .key) {
            self.resultMessage = UserDefaults.getValue(for: .key)
        } else {
            fetchData()
        }
    }
    
    func saveString(_ value: String) {
        UserDefaults.save(string: value)
    }
    
}

// MARK: - Private functions

private extension RandomStringViewModel {
    
    func fetchData() {
        randomStirngRepository.fetchData { publisher in
            self.cancellable = publisher
                .receive(on: RunLoop.main)
                .map { "\($0.activity) \n\n\($0.type) \n\n\($0.participants)" }
                .catch { _ in Just(.errorText) }
                .assign(to: \.resultMessage, on: self)
        }
    }
    
}
