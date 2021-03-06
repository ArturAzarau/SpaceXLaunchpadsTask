//
//  FillableWithValues.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

protocol FillableWithValues {
    associatedtype Value
    
    func fillWith(value: Value)
}
