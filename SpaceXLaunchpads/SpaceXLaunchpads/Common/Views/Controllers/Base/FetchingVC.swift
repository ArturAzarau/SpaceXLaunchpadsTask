//
//  ViewController.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

class FetchingViewController<MapperType: ObjectsMapper, ModelType, CellMakerType: CellMaker, ViewModelType>: UITableViewController where ViewModelType: FetchingViewModel<MapperType, ModelType, CellMakerType> {
    
    let viewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindAll()
        startFetching()
    }
    
    func bindAll() {
        bindTableView()
    }
    
    func bindTableView() {
        viewModel.bind(tableView: tableView)
    }
    
    func startFetching() {
        viewModel.startFetching()
    }
    
    func configureTableView() {
        tableView.tableFooterView = .init()
        tableView.register(CellMakerType.CellType.self,
                           forCellReuseIdentifier: CellMakerType.CellType.cellIdentifier)
    }
}
