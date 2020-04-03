//
//  ConvertableToValue.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

protocol ConvertableToValue {
    
    associatedtype ConvertationValue
    
    func convertToValue() -> ConvertationValue
}
