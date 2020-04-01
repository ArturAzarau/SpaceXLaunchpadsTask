//
//  ViewController.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

class FetchingVC<MapperType: ObjectsMapper, ModelType, CellMakerType: CellMaker, ViewModelType>: UITableViewController, DisplayLaunchpadsModule where ViewModelType: FetchingViewModel<MapperType, ModelType, CellMakerType> {
    
    var onError: ParameterClosure<Error>?
    
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
        configureTableView()
        bindTableView()
        bindErrors()
        startFetching()
    }
    
    func bindErrors() {
        viewModel.observeErrors { [weak self] in
            self?.onError?($0)
        }
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
