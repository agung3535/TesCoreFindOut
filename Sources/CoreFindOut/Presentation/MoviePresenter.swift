//
//  File.swift
//  
//
//  Created by Putra on 17/06/22.
//

import Foundation
import Combine


public class MoviePresenter<Request, Response, Interator: MovieUseCase>: ObservableObject where Interator.Request == Request, Interator.Response == [Response] {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interator
    
    @Published public var list: [Response] = []
    @Published public var playing: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var errorMessagePlaying: String = ""
    @Published public var isLoading: Bool = true
    @Published public var isLoadingPlaying: Bool = true
    @Published public var isError: Bool = false
    @Published public var isErrorPlaying: Bool = false
    
    public init(useCase: Interator) {
        _useCase = useCase
    }
    
    public func getPlaying(request: Request, index: Int) {
        isLoading = true
        _useCase.execute(request: request, index: index)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessagePlaying = error.localizedDescription
                    self.isErrorPlaying = true
                    self.isLoadingPlaying = false
                case .finished:
                    self.isLoadingPlaying = false
                }
            }, receiveValue: { list in
                print("masuk list =\(list)")
                self.playing = list
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
                self.list = list
            }).store(in: &cancellables)
    }
    
    
}
