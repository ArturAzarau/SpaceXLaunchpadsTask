//
//  BaseInitializableView.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

class BaseInitializableView: UIView, InitializableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        
    }
    
    func configureLayout() {
        
    }
    
    func bindViews() {
        
    }
    
    func configureAppearance() {
        
    }
}
