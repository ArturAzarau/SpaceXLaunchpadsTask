//
//  LaunchpadCell.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class LaunchpadCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LaunchpadCell: ConfigurableCell {
    
    func configure(with object: Launchpad) {
        textLabel?.text = object.fullName
    }
}

extension LaunchpadCell: CellWithId {
    static var cellIdentifier: String {
        return "LaunchpadCell"
    }
}

