//
//  File.swift
//  
//
//  Created by Putra on 13/06/22.
//

import Foundation


public protocol Mapper {
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformResponseToEntity(response: Response) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
}
