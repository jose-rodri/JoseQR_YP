//
//  HomeScreemDelegate+Datasource.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 22/11/23.
//

import Foundation
import UIKit

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = self.searchUserList?.count {
            return list
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as HomeTableViewCell
        guard let indexP = self.searchUserList?[indexPath.row] else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.delegate = self  
        cell.displayInformation(indexP, indexPath.row)
        return cell
    }
}
