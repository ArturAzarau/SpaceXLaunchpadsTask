//
//  LaunchpadCellMaker.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Bond

final class LaunchpadCellMaker: CellMaker {
    
    typealias CellType = LaunchpadCell
    
    func createCell() -> TableViewBinderDataSource<OrderedCollectionChangeset<[Launchpad]>> {
        return .init({ (launchpads, indexPath, tableView) -> UITableViewCell in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellType.cellIdentifier,
                                                           for: indexPath) as? CellType else {
                fatalError("Invalid Cell Type")
            }
            
            cell.configure(with: launchpads[indexPath.row])
            return cell
        })
    }
}
