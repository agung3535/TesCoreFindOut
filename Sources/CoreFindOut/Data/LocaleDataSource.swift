//
//  File.swift
//  
//
//  Created by Putra on 13/06/22.
//

import Foundation
import Combine

public protocol LocaleDataSourceCore {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func add(entities: [Response]) -> AnyPublisher<Bool, Error>
    func get(id: String) -> AnyPublisher<Response, Error>
    func update(id: Int, entity: Response) -> AnyPublisher<Bool, Error>
    func delete(object: Response) -> AnyPublisher<Bool, Error>
    func cek(id: String) -> AnyPublisher<Bool, Error>
}
