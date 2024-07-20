//
//  ViewModel.swift
//  GameStream
//
//  Created by Anthony Rubio on 20/07/24.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel : ObservableObject {
    
    
    @Published var gamesInfo = [GameElement]()
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchGames() {
        
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [GameElement].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { games in
                self.gamesInfo = games
            })
            .store(in: &self.cancellables)
    }
    
}
