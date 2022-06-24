//
//  File.swift
//  
//
//  Created by Putra on 17/06/22.
//

import Foundation
import Combine

public struct InteractorMovie<Request, Response, R:MovieRepository>: MovieUseCase where R.Request == Request, R.Response == Response {
    private let repository: R
    
    public init(repository: R) {
        self.repository = repository
    }
    
    public func execute(request: Request?, index: Int) -> AnyPublisher<Response, Error> {
        repository.execute(request: request, index: index)
    }
}
