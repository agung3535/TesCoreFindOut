//
//  File.swift
//  
//
//  Created by Putra on 17/06/22.
//

import Foundation
import Combine
import Alamofire

public protocol MovieRemoteDataSourceCore {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?, index: Int) -> AnyPublisher<Response, Error>
}
