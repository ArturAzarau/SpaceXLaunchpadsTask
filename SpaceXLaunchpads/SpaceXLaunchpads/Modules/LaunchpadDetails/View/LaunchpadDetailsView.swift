//
//  LaunchpadDetailsView.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 03.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit
import SnapKit

final class LaunchpadDetailsView: BaseInitializableView {
    
    let nameLabel = UILabel()
    let regionLabel = UILabel()
    let detailsTextView = UITextView()
    
    override func addViews() {
        super.addViews()
        
        addSubviews(nameLabel, regionLabel, detailsTextView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        configureNameLabelConstraints()
        configureRegionLabelConstraints()
        configureDetailsTextViewConstraints()
        configureAllViewLeadingAndTrailingConstraints()
    }
    
    private func configureNameLabelConstraints() {
        nameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(safeAreaInsets.top).inset(CGFloat.defaultTopOffset)
        }
    }
    
    private func configureRegionLabelConstraints() {
        regionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(nameLabel.snp.bottom).offset(CGFloat.defaultTopOffset)
        }
    }
    
    private func configureDetailsTextViewConstraints() {
        detailsTextView.snp.makeConstraints { maker in
            maker.top.equalTo(regionLabel.snp.bottom).offset(CGFloat.defaultTopOffset)
            maker.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func configureAllViewLeadingAndTrailingConstraints() {
        subviews.forEach {
            $0.snp.makeConstraints { maker in
                maker.leading.trailing.equalToSuperview().inset(CGFloat.defaultLeadingTrailingInset)
            }
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
    }
}

extension LaunchpadDetailsView: ConfigurableView {
    
    func configure(with object: Launchpad) {
        nameLabel.text = object.location.name
        regionLabel.text = object.location.region
        detailsTextView.text = object.details
    }
}

private extension CGFloat {
    static let defaultLeadingTrailingInset: CGFloat = 20
    static let defaultTopOffset: CGFloat = 20
}
