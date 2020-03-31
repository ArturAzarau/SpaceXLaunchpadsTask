//
//  LaunchpadMapper.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import ObjectMapper

final class LaunchpadsMapper: ObjectsMapper {
    func mapObjects(from data: Data) throws -> [Launchpad] {
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
            throw ObjectsMapperError.invalidJSON
        }
        return try Mapper<Launchpad>().mapArray(JSONArray: json)
    }
}
