//
//  ObjectsMapper.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

protocol ObjectsMapper: AnyObject, Initializable {
    
    associatedtype ObjectType
    
    func mapObjects(from data: Data) throws -> [ObjectType]
}
