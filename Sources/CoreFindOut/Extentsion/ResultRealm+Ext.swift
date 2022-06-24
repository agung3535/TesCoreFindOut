//
//  File.swift
//  
//
//  Created by Putra on 15/06/22.
//

import Foundation
import RealmSwift

extension Results {
    public func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
              if let result = self[index] as? T {
                array.append(result)
              }
            }
        return array
    }
    
}
