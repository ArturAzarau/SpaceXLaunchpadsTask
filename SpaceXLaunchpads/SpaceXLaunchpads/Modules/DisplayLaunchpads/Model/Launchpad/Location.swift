//
//  Location.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import ObjectMapper

struct Location {
    let name: String
    let region: String
    let latitude: Double
    let longitude: Double
}

extension Location: ImmutableMappable {
    init(map: Map) throws {
        name = try map.value("name")
        region = try map.value("region")
        latitude = try map.value("latitude")
        longitude = try map.value("longitude")
    }
}
