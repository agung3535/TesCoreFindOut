//
//  File.swift
//  
//
//  Created by Putra on 19/06/22.
//

import Foundation
import Combine

public protocol FavoriteUseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request, index: Int) -> AnyPublisher<Response, Error>
    
    func addFavorite(data: Request) -> AnyPublisher<Bool, Error>
    
    func get(id: String, endPoint: String) -> AnyPublisher<Bool, Error>
    
    func cek(id: String) -> AnyPublisher<Bool, Error>
    
    func delete(id: String, endPoint: String) -> AnyPublisher<Bool, Error>
}
