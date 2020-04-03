//
//  BackgroundWritingDatabaseService.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

protocol BackgroundWritingDatabaseService: DatabaseService where Object: (FillableWithValues & ConvertableToValue), Object.Value == ObjectToFillWith, Object.ConvertationValue ==  ObjectToFillWith {
    
    associatedtype ObjectToFillWith
    
    func writeDataInBackground(data: [ObjectToFillWith])
}
