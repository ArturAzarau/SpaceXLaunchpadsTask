//
//  CellWithId.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol CellWithId: UITableViewCell {
    static var cellIdentifier: String { get }
}

