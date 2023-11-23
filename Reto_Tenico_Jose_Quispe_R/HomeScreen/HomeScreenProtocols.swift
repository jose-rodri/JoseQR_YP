//
//  HomeScreenProtocols.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 21/11/23.
//



import Foundation
import UIKit


protocol HomeScreenPresenterToViewProtocol: AnyObject {
    func dataUsers(data: Users)
    
}

protocol HomeScreenInteractorToPresenterProtocol: AnyObject {
    func fetchedDataSuccess(data: Users)
    func fetchedDataError()
}


protocol HomeScreenPresenterToInteractorProtocol: AnyObject {
    var presenter: HomeScreenInteractorToPresenterProtocol? { get set }
    func prepareResponseForModel()
}


protocol HomeScreenViewToPresenterProtocol: AnyObject {
    var view: HomeScreenPresenterToViewProtocol? { get set }
    var interactor:  HomeScreenPresenterToInteractorProtocol? { get set }
    var router: HomeScreenPresenterToRouterProtocol? { get set }
    
    func updateView()
    func prepareToGoToDetail(origin: UIViewController, data: UserResult)
    func prepareToGoToMap(origin: UIViewController, data: UserResult)
}

protocol  HomeScreenPresenterToRouterProtocol: AnyObject {
    static func createModule(usingNavigationFactory factory: NavigationFactory) -> UINavigationController
    func prepareToGoToDetail(origin: UIViewController, data: UserResult)
    func prepareToGoToMap(origin: UIViewController, data: UserResult)
}
