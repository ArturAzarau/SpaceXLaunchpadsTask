//
//  RealmBackgroundWriter.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import RealmSwift

protocol RealmBackgroundWriter: class where Object: FillableWithValues, Object.Value == ObjectToFillWith {
    
    associatedtype Object
    associatedtype ObjectToFillWith
    
    func writeDataInBackground(data: [ObjectToFillWith])
    func invalidate()
}
