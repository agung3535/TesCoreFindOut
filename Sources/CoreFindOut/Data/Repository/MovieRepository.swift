//
//  File.swift
//  
//
//  Created by Putra on 17/06/22.
//

import Foundation
import Combine

public protocol MovieRepository {
    // alamofire
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?, index: Int) -> AnyPublisher<Response, Error>
    
    func add(request: Request?) -> AnyPublisher<Bool, Error>
}
