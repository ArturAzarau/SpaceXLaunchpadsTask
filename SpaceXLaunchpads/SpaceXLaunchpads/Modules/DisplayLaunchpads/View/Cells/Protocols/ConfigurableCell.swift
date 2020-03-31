//
//  ConfigurableCell.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol ConfigurableCell: UITableViewCell {
    
    associatedtype ObjectToConfigureWith
    
    func configure(with object: ObjectToConfigureWith)
}
