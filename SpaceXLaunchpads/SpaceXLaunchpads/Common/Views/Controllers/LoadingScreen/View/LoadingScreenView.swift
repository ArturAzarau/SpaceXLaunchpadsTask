//
//  LoadingScreenView.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit
import SnapKit

final class LoadingScreenView: BaseInitializableView {
    
    let activityIndicator = UIActivityIndicatorView()
    let backView = UIView()
    
    override func addViews() {
        super.addViews()
        
        addSubviews(backView, activityIndicator)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        backView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
}
