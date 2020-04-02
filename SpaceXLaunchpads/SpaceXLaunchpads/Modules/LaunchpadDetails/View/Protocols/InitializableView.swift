//
//  InitializableView.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

protocol InitializableView: UIView {
    func addViews()
    func configureLayout()
    func configureAppearance()
}

extension InitializableView {
    func initializeView() {
        addViews()
        configureLayout()
        configureAppearance()
    }
}
