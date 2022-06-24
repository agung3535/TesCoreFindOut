//
//  File.swift
//  
//
//  Created by Putra on 13/06/22.
//

import Foundation
import Combine

public struct InteractorCore<Request, Response, R:Repository>: UseCaseCore where R.Request == Request, R.Response == Response {
    private let repository: R
    
    public init(repository: R) {
        self.repository = repository
    }
    
    public func execute(request: Request?) -> AnyPublisher<Response, Error> {
        repository.execute(request: request)
    }
}

