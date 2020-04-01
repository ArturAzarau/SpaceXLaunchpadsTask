//
//  LaunchpadDetailsVC.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 01.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class LaunchpadDetailsVC: UIViewController, LaunchpadDetailsModule {
    
    private let viewModel: LaunchpadDetailsViewModel
    
    init(viewModel: LaunchpadDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
