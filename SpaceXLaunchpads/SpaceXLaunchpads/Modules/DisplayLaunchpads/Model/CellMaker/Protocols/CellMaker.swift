//
//  CellMaker.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Bond

protocol CellMaker: class where CellType.ObjectToConfigureWith == ModelType {
    
    associatedtype ModelType
    associatedtype CellType: CellWithId & ConfigurableCell
    
    func createCell() -> TableViewBinderDataSource<OrderedCollectionChangeset<[ModelType]>>
}

extension CellMaker {
    func createCell() -> TableViewBinderDataSource<OrderedCollectionChangeset<[ModelType]>> {
        return .init({ (models, indexPath, tableView) -> UITableViewCell in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellType.cellIdentifier,
                                                           for: indexPath) as? CellType else {
                fatalError("Invalid Cell Type")
            }
            
            cell.configure(with: models[indexPath.row])
            return cell
        })
    }
}
