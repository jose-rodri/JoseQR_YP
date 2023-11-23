//
//  HomeScreenRouter.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 21/11/23.
//


import Foundation
import UIKit

class HomeScreenRouter: HomeScreenPresenterToRouterProtocol {

    static func createModule(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let view = HomeScreenViewController()
        let presenter: HomeScreenViewToPresenterProtocol & HomeScreenInteractorToPresenterProtocol = HomeScreenPresenter()
        let interactor: HomeScreenPresenterToInteractorProtocol = HomeScreenInteractor()
        let router: HomeScreenPresenterToRouterProtocol = HomeScreenRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return factory(view)
        
        
    }
    
    
    func prepareToGoToDetail(origin: UIViewController, data: UserResult){
        let vc = DetailRouter.createModule(data: data)
        origin.navigationController?.pushViewController(vc, animated: true)
    }
    
    func prepareToGoToMap(origin: UIViewController, data: UserResult) {
        let vc = MapRouter.createModule(data: data)
        origin.navigationController?.pushViewController(vc, animated: true)
    }
}
