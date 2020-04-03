//
//  LaunchpadDetailsVC.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 01.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class LaunchpadDetailsViewController: BaseViewControllerWithViewModel<LaunchpadDetailsView, LaunchpadDetailsViewModel>, LaunchpadDetailsModule {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.launchpad.fullName
        edgesForExtendedLayout = []
        customView.configure(with: viewModel.launchpad)
    }
    
}
