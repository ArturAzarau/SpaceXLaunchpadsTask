//
//  CellMaker.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Bond

protocol CellMaker: class {
    
    associatedtype ModelType
    associatedtype CellType: CellWithId & ConfigurableCell
    
    func createCell() -> TableViewBinderDataSource<OrderedCollectionChangeset<[ModelType]>>
}
