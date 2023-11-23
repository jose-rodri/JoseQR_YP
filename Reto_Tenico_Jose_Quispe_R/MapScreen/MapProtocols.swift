//
//  MapProtocols.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 22/11/23.
//


import Foundation
import UIKit


protocol MapPresenterToViewProtocol: AnyObject {
    
}

protocol MapInteractorToPresenterProtocol: AnyObject {
  
}

protocol MapPresenterToInteractorProtocol: AnyObject {
    var presenter: MapInteractorToPresenterProtocol? { get set }

}

protocol MapViewToPresenterProtocol: AnyObject {
    var view: MapPresenterToViewProtocol? { get set }
    var interactor: MapPresenterToInteractorProtocol? { get set }
    var router: MapPresenterToRouterProtocol? { get set }
    var data: UserResult? { get set }
}

protocol  MapPresenterToRouterProtocol: AnyObject {
    static func  createModule(data: UserResult) -> UIViewController
   
}
