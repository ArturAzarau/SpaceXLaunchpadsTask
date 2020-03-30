//
//  BaseCoordinator.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 30.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import Foundation

typealias VoidBlock = () -> ()

class BaseCoordinator: Coordinatable {

    private(set) var childCoordinators: [Coordinatable] = []

    // MARK: - Coordinatable

    var onFinish: ParameterClosure<Coordinatable>?

    func start() {
        assertionFailure("Method start() has not been implemented")
    }

    // MARK: - Public Functions

    func add(child coordinator: Coordinatable) {
        for element in childCoordinators where element === coordinator {
            remove(child: element)
            return
        }
        childCoordinators.append(coordinator)
    }

    func remove(child coordinator: Coordinatable?) {
        guard !childCoordinators.isEmpty else {
            return
        }
        guard let coordinator = coordinator else {
            return
        }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            return
        }
    }

    func finishFlow() {
        onFinish?(self)
    }

    @discardableResult
    func bindTo(_ coordinator: Coordinatable, onFinish: VoidBlock? = nil) -> Coordinatable {
        coordinator.onFinish = { [weak self] in
            onFinish?()
            self?.remove(child: $0)
        }
        add(child: coordinator)

        return coordinator
    }
}
