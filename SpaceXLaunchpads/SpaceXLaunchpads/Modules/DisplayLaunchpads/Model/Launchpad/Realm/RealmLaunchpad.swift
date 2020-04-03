//
//  RealmLaunchpad.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

//
//  Launchpad.swift
//  SpaceXLauchPads
//
//  Created by Artur Azarau on 27.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import RealmSwift

final class RealmLaunchpad: Object {
    
    // MARK: - Properties
    
    @objc dynamic var padid = 0
    @objc dynamic var id = String.empty
    @objc dynamic var name = String.empty
    @objc dynamic var fullName = String.empty
    @objc dynamic var status = String.empty
    @objc dynamic var location: RealmLocation? = RealmLocation()
    var vehiclesLaunched = List<String>()
    @objc dynamic var attemptedLaunches = 0
    @objc dynamic var successfulLaunches = 0
    @objc dynamic var wikipedia = String.empty
    @objc dynamic var details = String.empty
}

extension RealmLaunchpad: FillableWithValues {
    
    func fillWith(value: Launchpad) {
        padid = value.padid
        id = value.id
        name = value.name
        fullName = value.fullName
        status = value.status
        
        let realmLocation = RealmLocation()
        realmLocation.fillWith(value: value.location)
        location = realmLocation
        
        vehiclesLaunched.append(objectsIn: value.vehiclesLaunched)
        attemptedLaunches = value.attemptedLaunches
        successfulLaunches = value.successfulLaunches
        wikipedia = value.wikipedia
        details = value.details
    }
}

extension RealmLaunchpad: ConvertableToValue {
    
    func convertToValue() -> Launchpad {
        return .init(padid: padid,
                     id: id,
                     name: name,
                     fullName: fullName,
                     status: status,
                     location: location?.convertToValue() ?? Location(),
                     vehiclesLaunched: Array(vehiclesLaunched),
                     attemptedLaunches: attemptedLaunches,
                     successfulLaunches: successfulLaunches,
                     wikipedia: wikipedia,
                     details: details)
    }
}
