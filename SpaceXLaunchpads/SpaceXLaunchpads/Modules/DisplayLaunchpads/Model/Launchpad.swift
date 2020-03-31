//
//  Launchpad.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import ObjectMapper

struct Launchpad: ImmutableMappable {
    
    // MARK: - Properties
    
    let padid: Int
    let id: String
    let name: String
    let fullName: String
    let status: String
    let location: Location
    let vehiclesLaunched: [String]
    let attemptedLaunches: Int
    let successfulLaunches: Int
    let wikipedia: String
    let details: String
    
    // MARK: - Mappable
    
    init(map: Map) throws {
        padid = try map.value("padid")
        id = try map.value("id")
        name = try map.value("name")
        fullName = try map.value("full_name")
        status = try map.value("status")
        location = try map.value("location")
        vehiclesLaunched = try map.value("vehicles_launched")
        attemptedLaunches = try map.value("attempted_launches")
        successfulLaunches = try map.value("successful_launches")
        wikipedia = try map.value("wikipedia")
        details = try map.value("details")
    }
}
