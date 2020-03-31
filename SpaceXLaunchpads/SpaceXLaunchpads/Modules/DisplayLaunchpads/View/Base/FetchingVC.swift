//
//  ViewController.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

class FetchingVC<MapperType: ObjectsMapper, ModelType, CellMakerType: CellMaker, ViewModelType>: UITableViewController, DisplayLaunchpadsModule where ViewModelType: FetchingViewModel<MapperType, ModelType, CellMakerType> {
    
    private let viewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CellMakerType.CellType.self,
                           forCellReuseIdentifier: CellMakerType.CellType.cellIdentifier)
        viewModel.bind(tableView: tableView)
        viewModel.startFetching()
    }
}

