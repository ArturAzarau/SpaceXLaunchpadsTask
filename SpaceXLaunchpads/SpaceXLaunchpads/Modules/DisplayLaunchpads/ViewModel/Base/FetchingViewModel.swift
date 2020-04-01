//
//  DisplayLaunchpadsViewModel.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import PromiseKit
import Bond
import ReactiveKit

class FetchingViewModel<MapperType: ObjectsMapper, ModelType, CellMakerType: CellMaker>
where MapperType.ObjectType == ModelType, CellMakerType.ModelType == ModelType {
    
    let networkService: NetworkFetchingService
    let cellMaker: CellMakerType
    let models = Observable<[ModelType]>([])
    
    private let disposeBag = DisposeBag()
    let errorSubject = Subject<Error, Never>()
    let selectedItemSubject = Subject<ModelType, Never>()
    
    func observeErrors(with action: @escaping (Error) -> ()) {
        errorSubject.observeNext { error in
            action(error)
        }
        .dispose(in: disposeBag)
    }
    
    func observeSelectedItem(with action: @escaping (ModelType) -> ()) {
        selectedItemSubject.observeNext {
            action($0)
        }
        .dispose(in: disposeBag)
    }
    
    init(networkService: NetworkFetchingService, cellMaker: CellMakerType) {
        self.networkService = networkService
        self.cellMaker = cellMaker
    }
    
    func bind(tableView: UITableView) {
        models.bind(to: tableView, using: cellMaker.createCell()).dispose(in: disposeBag)
    }
    
    func startFetching() {
        fetchData()
    }
    
    func fetchData() {
        firstly {
            try networkService.fetchData()
        }.compactMap(on: .global(qos: .userInitiated), flags: nil) { data, _  -> [ModelType]? in
            let mapper = MapperType()
            return try? mapper.mapObjects(from: data)
        }.done { [weak self] in
            self?.proceed(newModels: $0)
        }.catch { [weak errorSubject] in
            errorSubject?.on(.next($0))
        }
    }
    
    func item(for indexPath: IndexPath) {
        selectedItemSubject.on(.next(models.value[indexPath.row]))
    }
    
    
    func proceed(newModels: [ModelType]) {
        models.on(.next(newModels))
    }
}
