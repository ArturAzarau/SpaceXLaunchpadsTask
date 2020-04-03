//
//  ConfigurableView.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol ConfigurableView: UIView {
    
    associatedtype ObjectToConfigureWith
    
    func configure(with object: ObjectToConfigureWith)
}
