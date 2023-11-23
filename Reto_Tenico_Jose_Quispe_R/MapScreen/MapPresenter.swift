//
//  MapPresenter.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 22/11/23.
//


import Foundation
import UIKit
import SDWebImage


class MapPresenter: MapViewToPresenterProtocol{
    
    var view:  MapPresenterToViewProtocol?
    var interactor:  MapPresenterToInteractorProtocol?
    var router:  MapPresenterToRouterProtocol?
    
    var data: UserResult?  
}

extension  MapPresenter:  MapInteractorToPresenterProtocol {

}
