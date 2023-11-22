//
//  HomeScreenViewController.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 21/11/23.
//

import Foundation
import UIKit

class HomeScreenViewController: UIViewController  {
    
    var presenter: HomeScreenViewToPresenterProtocol?
    var myView: MyView? { view as? MyView }
    
    
    var userList: Users? = nil
    
    override func loadView() {
        view = MyView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reto JoseQR"
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
    }

    
    func isRunningTests() -> Bool {
        return NSClassFromString("XCTestCase") != nil
    }
}

extension HomeScreenViewController:  HomeScreenPresenterToViewProtocol {
    
    func dataUsers(data: Users) {
        self.userList = data
        self.myView?.tableView.reloadData()
        
    }
}
