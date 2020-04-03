//
//  BaseViewController.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

class BaseViewController<ViewType: InitializableView>: UIViewController {
    
    lazy var customView = ViewType()
    
    override func loadView() {
        view = customView
    }
}
