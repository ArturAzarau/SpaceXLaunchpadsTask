//
//  DisplayLaucnhpadsVC.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 01.04.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import UIKit

final class DisplayLaunchpadsVC: FetchingVC<LaunchpadsMapper, Launchpad, LaunchpadCellMaker, FetchingAndBGCachingViewModel<LaunchpadsMapper, Launchpad, LaunchpadCellMaker, RealmDatabaseService>>, DisplayLaunchpadsModule {
    
    var onLoading: ParameterClosure<Bool>?
    var onItemSelected: ParameterClosure<Launchpad>?
    var onError: ParameterClosure<Error>?
    
    override func bindAll() {
        super.bindAll()
        
        bindLoadingState()
        bindErrors()
        bindSelectedItem()
    }
    
    func bindErrors() {
        viewModel.observeErrors { [weak self] in
            self?.onError?($0)
        }
    }
    
    func bindSelectedItem() {
        viewModel.observeSelectedItem { [weak self] in
            self?.onItemSelected?($0)
        }
    }
    
    func bindLoadingState() {
        viewModel.observeLoadingState { [weak self] in
            self?.onLoading?($0)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.item(for: indexPath)
    }
}
