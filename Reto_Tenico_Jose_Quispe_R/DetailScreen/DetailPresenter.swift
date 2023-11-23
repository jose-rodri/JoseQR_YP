//
//  DetailPresenter.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


class DetailPresenter: DetailViewToPresenterProtocol{
    
    var view: DetailPresenterToViewProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var router:  DetailPresenterToRouterProtocol?
    
    var data: UserResult?
    
    func updateView() {
        loadData()
      
    }
    
    func loadData() {
      
        if let vc = view as? UIViewController {
              vc.title = "User Detail"
            
            if let unwrappedName = data?.name {
                if let firstName = unwrappedName.first {
                    self.view?.labelTitle.text = firstName
                } else {
                    print("First name is nil.")
                }
            } else {
                print("The Name object is nil.")
            }
            
           
            self.view?.labelDescription.text = data?.location?.country
            self.view?.icImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.view?.icImage.sd_setImage(with: URL(string: data?.picture?.large ?? "" ))
        }
      
    }
}


extension  DetailPresenter:  DetailInteractorToPresenterProtocol {

}
