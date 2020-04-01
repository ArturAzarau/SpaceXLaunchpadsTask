//
//  ModalRoutable.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 01.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol ModalRoutable {

    var rootController: UIViewController? { get }

    func presentModule(_ module: Presentable,
                       animated: Bool,
                       completion: VoidBlock?)
    func dismissModule(animated: Bool, completion: VoidBlock?)
}

extension ModalRoutable {

    func presentModule(_ module: Presentable,
                       animated: Bool = true,
                       completion: VoidBlock? = nil) {

        rootController?.present(module.toPresent(),
                                animated: animated,
                                completion: completion)
    }

    func dismissModule(animated: Bool = true, completion: VoidBlock? = nil) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
}
