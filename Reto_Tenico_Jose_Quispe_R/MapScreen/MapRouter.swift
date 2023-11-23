//
//  MapRouter.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 22/11/23.
//

import Foundation
import UIKit

class MapRouter : MapPresenterToRouterProtocol {

    static func createModule(data: UserResult) -> UIViewController {
        let view = MapViewController(nibName: "MapViewController", bundle: Bundle.main)
        let presenter : MapViewToPresenterProtocol & MapInteractorToPresenterProtocol =
        MapPresenter()
        let interactor : MapPresenterToInteractorProtocol = MapInteractor()
        let router: MapPresenterToRouterProtocol =  MapRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.data = data
        view.data = data
        return view
        
        
    }

    
}
