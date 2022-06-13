//
//  File.swift
//  
//
//  Created by Putra on 13/06/22.
//

import Foundation
import Combine

public struct InteractorCore<Request, Response, Repository>: UseCaseCore where Repository.Request == Request, Repository.Response == Response {
    private let repository: Repository
    
    public init(repository: Repository) {
        self.repository = repository
    }
    
    public func execute(request: Request?) -> AnyPublisher<Response, Error> {
        repository.execute(request: request)
    }
}

