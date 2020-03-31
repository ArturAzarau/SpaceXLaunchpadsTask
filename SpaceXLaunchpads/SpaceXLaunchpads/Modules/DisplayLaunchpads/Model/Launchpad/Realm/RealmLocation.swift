//
//  RealmLocation.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import RealmSwift

@objcMembers
final class RealmLocation: Object {
    
    dynamic var name = String.empty
    dynamic var region = String.empty
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
}

extension RealmLocation: FillableWithValues {
    
    func convertToValue() -> Location {
        return .init(name: name,
                     region: region,
                     latitude: latitude,
                     longitude: longitude)
    }
    
    func fillWith(value: Location) {
        name = value.name
        region = value.region
        latitude = value.latitude
        longitude = value.longitude
    }
}
