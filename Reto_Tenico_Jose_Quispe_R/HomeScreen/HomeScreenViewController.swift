//
//  HomeScreenViewController.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 21/11/23.
//

import Foundation
import UIKit

class HomeScreenViewController: UIViewController  {
    
    var presenter: HomeScreenViewToPresenterProtocol?
    var myView: MyView? { view as? MyView }
    
    var userResult: [UserResult]?
    var searchUserList: [UserResult]?
    
    override func loadView() {
        view = MyView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User List"
        callService()
        protocolDefinition()
    }
    
    private func callService() {
        if !isRunningTests() {
            presenter?.updateView()
        }
    }
    
    private func protocolDefinition() {
        myView?.tableView.dataSource = self
        myView?.tableView.delegate = self
        myView?.searchBar.delegate = self
    }
    
    func isRunningTests() -> Bool {
        return NSClassFromString("XCTestCase") != nil
    }
}

extension HomeScreenViewController:  HomeScreenPresenterToViewProtocol {
    
    func dataUsers(data: Users) {
        self.userResult = data.results
        self.searchUserList = userResult
        self.myView?.tableView.reloadData()
    }
}

extension HomeScreenViewController: tappedCell {
    func detailPressed(info: UserResult) {
        self.presenter?.prepareToGoToDetail(origin: self, data: info)
    }
    
    func mapPressed(info: UserResult) {
        self.presenter?.prepareToGoToMap(origin: self, data: info)
    }
}

extension HomeScreenViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchUserList = []
        
        if searchText == "" {
            self.searchUserList = userResult
        } else {
            self.userResult?.forEach({ item in
                if let username = item.name?.first?.description {
                    if  username.lowercased().contains(searchText.lowercased()) {
                        self.searchUserList?.append(item)
                    }
                }
            })
        }
        self.myView?.tableView.reloadData()
    }
}


