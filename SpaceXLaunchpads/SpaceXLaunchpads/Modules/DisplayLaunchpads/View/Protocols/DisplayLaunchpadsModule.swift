//
//  DisplayLaunchpadsModule.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

protocol DisplayLaunchpadsModule: Presentable {
    
    var onError: ParameterClosure<Error>? { get set }
    var onItemSelected: ParameterClosure<Launchpad>? { get set }
    var onLoading: ParameterClosure<Bool>? { get set }
}
