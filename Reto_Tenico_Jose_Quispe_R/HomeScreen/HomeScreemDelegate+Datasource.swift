//
//  HomeScreemDelegate+Datasource.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 22/11/23.
//

import Foundation
import UIKit

extension HomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = userList?.results?.count {
            return list
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as HomeTableViewCell
        guard let indexP = userList?.results?[indexPath.row] else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.displayInformation(indexP, indexPath.row)
        return cell
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         print("tapped= \(userList?.results?[indexPath.row])")
    }
    
}
