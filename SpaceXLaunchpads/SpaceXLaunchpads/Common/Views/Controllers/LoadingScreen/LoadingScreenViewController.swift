//
//  LoadingScreenViewController.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

final class LoadingScreenViewController: BaseViewController<LoadingScreenView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.activityIndicator.startAnimating()
    }
}
