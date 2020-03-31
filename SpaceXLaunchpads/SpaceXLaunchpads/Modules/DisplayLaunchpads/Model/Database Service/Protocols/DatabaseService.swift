//
//  DatabaseService.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

protocol DatabaseService: class {
    
    associatedtype Object
    
    func fetchData() -> [Object]
    func write(data: [Object]) throws
    func deleteAll() throws
}

