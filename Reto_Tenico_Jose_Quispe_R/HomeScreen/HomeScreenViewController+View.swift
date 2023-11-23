//
//  HomeScreenViewController+View.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 22/11/23.
//

import Foundation
import UIKit

extension HomeScreenViewController {
    
    final class MyView: UIView {
        
        private lazy var baseView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            return view
        }()
        
        public let searchBar: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            searchBar.placeholder = "Find"
            return searchBar
        }()
        
        public lazy var tableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorStyle = .none
           
            return tableView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setup() {
            setupViews()
            setupConstraints()
        }
        
        private func setupViews() {
            addSubview(baseView)
            baseView.addSubview(tableView)
            baseView.addSubview(searchBar)
            configureTableView()
            setupConstraints()
            
            
            

        }
        
        private func configureTableView() {
            tableView.register(HomeTableViewCell.self)
            
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                baseView.topAnchor.constraint(equalTo: topAnchor),
                baseView.bottomAnchor.constraint(equalTo: bottomAnchor),
                baseView.leadingAnchor.constraint(equalTo: leadingAnchor),
                baseView.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                searchBar.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
                searchBar.topAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.topAnchor),
                
                tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
                tableView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor)
            ])
        }
    }
}
