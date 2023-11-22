//
//  HomeScreenPresenter.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 21/11/23.
//



import Foundation
import UIKit

class HomeScreenPresenter: HomeScreenViewToPresenterProtocol{
    
    var view: HomeScreenPresenterToViewProtocol?
    var interactor: HomeScreenPresenterToInteractorProtocol?
    var router: HomeScreenPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.prepareResponseForModel()
        
    }
    
    
}


extension HomeScreenPresenter : HomeScreenInteractorToPresenterProtocol {
    func fetchedDataSuccess(data: Users) {
        print(data)
        
        self.view?.dataUsers(data: data)
    }
    
    func fetchedDataError() {
        print("Error when getting service ")
    }
   
}
