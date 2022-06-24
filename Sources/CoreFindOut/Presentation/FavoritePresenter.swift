//
//  SwiftUIView.swift
//  
//
//  Created by Putra on 19/06/22.
//

import Foundation
import Combine


public class FavoritePresenter<Request, Response, Interator: FavoriteUseCase>: ObservableObject where Interator.Request == Request, Interator.Response == [Response] {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interator
    
    @Published public var movie: [Response] = []
    @Published public var tv: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var errorMessageTv: String = ""
    @Published public var isLoading: Bool = true
    @Published public var isLoadingTv: Bool = true
    @Published public var isError: Bool = false
    @Published public var isErrorTv: Bool = false
    @Published public var isFavorite: Bool = false
    
    public init(useCase: Interator) {
        _useCase = useCase
    }
    
    public func getFavMovie(request: Request, index: Int) {
        isLoading = true
        _useCase.execute(request: request, index: index)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { list in
                print("masuk list =\(list)")
                DispatchQueue.main.async {
                    self.movie = list
                }
                
            }).store(in: &cancellables)
    }
    
    public func cekFavorite(id: String) {
        self.isLoading = true
        _useCase.cek(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.isLoading = false
                    self.isError = true
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { fav in
                self.isFavorite = fav
                print("masuk is favorite = \(fav)")
            }).store(in: &cancellables)
    }
    
    public func addFavorite(id: String, endPoint: String) {
        _useCase.get(id: id, endPoint: endPoint)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.isLoading = false
                    self.isError = true
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { fav  in
                self.isFavorite = fav
            }).store(in: &cancellables)
    }
    
    public func removeFavorite(id: String, endPoint: String) {
        _useCase.delete(id: id, endPoint: endPoint)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.isLoading = false
                    self.isError = true
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { fav  in
                self.isFavorite = !fav
            }).store(in: &cancellables)
    }
    
    public func getPopular(request: Request, index: Int) {
        isLoading = true
        _useCase.execute(request: request, index: index)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { list in
                print("masuk list =\(list)")
                self.tv = list
            }).store(in: &cancellables)
    }
    
    
}



