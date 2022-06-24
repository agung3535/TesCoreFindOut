//
//  File.swift
//  
//
//  Created by Putra on 19/06/22.
//

import Foundation
import Combine

public protocol FavoriteRepository {
    // alamofire
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?, index: Int) -> AnyPublisher<Response, Error>
    
    func add(request: Request?) -> AnyPublisher<Bool, Error>
    
    func get(id: String, endPoint: String) -> AnyPublisher<Bool, Error>
    
    func cek(id: String) -> AnyPublisher<Bool, Error>
    
    func delete(id: String, endPoint: String) -> AnyPublisher<Bool, Error>
}
