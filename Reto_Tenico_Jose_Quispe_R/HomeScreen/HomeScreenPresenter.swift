//
//  HomeScreenPresenter.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 21/11/23.
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
    
    func prepareToGoToDetail(origin: UIViewController, data: UserResult) {
        self.router?.prepareToGoToDetail(origin: origin, data: data)
    }
    
    func prepareToGoToMap(origin: UIViewController, data: UserResult) {
        self.router?.prepareToGoToMap(origin: origin, data: data)
    }
    
}


extension HomeScreenPresenter : HomeScreenInteractorToPresenterProtocol {
    func fetchedDataSuccess(data: Users) {
        self.view?.dataUsers(data: data)
    }
    
    func fetchedDataError() {
        print("Error when getting service ")
    }
}
