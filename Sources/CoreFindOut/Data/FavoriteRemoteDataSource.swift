//
//  File.swift
//  
//
//  Created by Putra on 20/06/22.
//

import Foundation
import Combine
import Alamofire

public protocol FavoriteRemoteDataSourceCore {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?, id: Int, endPoint: String) -> AnyPublisher<Response, Error>
}
