//
//  Coordinatable.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

typealias ParameterClosure<T> = (T) -> Void

protocol Coordinatable: class {
    
    var onFinish: ParameterClosure<Coordinatable>? { get set }
    
    func start()
}
