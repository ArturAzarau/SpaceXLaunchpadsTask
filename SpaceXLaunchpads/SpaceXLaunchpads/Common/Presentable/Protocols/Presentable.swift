//
//  Presentable.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol Presentable: class {
    
    func toPresent() -> UIViewController
}

extension Presentable where Self: UIViewController {
    
    func toPresent() -> UIViewController {
        return self
    }
}

extension UIViewController: Presentable {}
