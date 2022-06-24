//
//  File.swift
//  
//
//  Created by Putra on 19/06/22.
//

import Foundation
import Combine

public struct InteractorFavorite<Request, Response, R:FavoriteRepository>: FavoriteUseCase where R.Request == Request, R.Response == Response {
    
    
    
    
    private let repository: R
    
    public init(repository: R) {
        self.repository = repository
    }
    
    public func execute(request: Request?, index: Int) -> AnyPublisher<Response, Error> {
        repository.execute(request: request, index: index)
    }
    
    public func addFavorite(data: Request?) -> AnyPublisher<Bool, Error> {
        repository.add(request: data)
    }
    
    public func get(id: String, endPoint: String) -> AnyPublisher<Bool, Error> {
        repository.get(id: id, endPoint: endPoint)
    }
    
    public func cek(id: String) -> AnyPublisher<Bool, Error> {
        repository.cek(id: id)
    }
    
    public func delete(id: String, endPoint: String) -> AnyPublisher<Bool, Error> {
        repository.delete(id: id, endPoint: endPoint)
    }
}
