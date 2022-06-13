//
//  File.swift
//  
//
//  Created by Putra on 13/06/22.
//

import Foundation
import Combine

public protocol Repository {
    // alamofire
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
