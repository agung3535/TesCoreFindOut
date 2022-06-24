//
//  File.swift
//  
//
//  Created by Putra on 16/06/22.
//

import Foundation
import Combine

public class GetPresenter<Request, Response, Interactor: UseCaseCore>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    private var cancellables: Set<AnyCancellable> = []
    
    private let _useCase: Interactor
    private let _request: Request
    @Published public var data: Response?
    
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor, request: Request, data: Response? = nil) {
        _useCase = useCase
        _request = request
        self.data = data
    }
    
    public func get() {
        isLoading = true
        _useCase.execute(request: _request)
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
            }, receiveValue: { response in
                self.data = response
            })
            .store(in: &cancellables)
    }
    
}
