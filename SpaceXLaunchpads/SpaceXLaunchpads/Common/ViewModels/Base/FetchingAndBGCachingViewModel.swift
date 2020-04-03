//
//  BaseFetchingAndBGCachingViewModel.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

class FetchingAndBGCachingViewModel<MapperType: ObjectsMapper, ModelType, CellMakerType: CellMaker, DatabaseServiceType: BackgroundWritingDatabaseService>: FetchingViewModel<MapperType, ModelType, CellMakerType> where MapperType.ObjectType == ModelType, CellMakerType.ModelType == ModelType, DatabaseServiceType.Object.Value == ModelType {
    
    let databaseService: DatabaseServiceType
    
    init(databaseService: DatabaseServiceType, networkService: NetworkFetchingService, cellMaker: CellMakerType) {
        self.databaseService = databaseService
        super.init(networkService: networkService, cellMaker: cellMaker)
    }
    
    override func proceed(newModels: [ModelType]) {
        super.proceed(newModels: newModels)
        
        databaseService.writeDataInBackground(data: newModels)
    }
    
    override func startFetching() {
        let launchpads = databaseService.fetchData()
        if !launchpads.isEmpty {
            let next = launchpads.map { $0.convertToValue() }
            models.on(.next(next))
        }
        
        fetchData()
    }
}
