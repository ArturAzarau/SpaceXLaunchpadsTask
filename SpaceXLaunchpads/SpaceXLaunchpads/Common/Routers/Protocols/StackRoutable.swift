//
//  StackRoutable.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol StackRoutable {
    
    var navigationController: UINavigationController { get }
    
    func pushModule(_ module: Presentable, animated: Bool)
    func setRootModule(_ module: Presentable, animated: Bool)
}

extension StackRoutable {
    
    func pushModule(_ module: Presentable, animated: Bool = true) {
        navigationController.pushViewController(module.toPresent(), animated: animated)
    }
    
    func setRootModule(_ module: Presentable, animated: Bool = true) {
        let controller = module.toPresent()
        navigationController.setViewControllers([controller], animated: animated)
    }

}
