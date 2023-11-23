//
//  DetailProtocol.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation
import UIKit


protocol DetailPresenterToViewProtocol: AnyObject {
    var labelTitle: UILabel! { get set }
    var icImage: UIImageView! { get set }
    var labelDescription: UILabel! { get set }
}

protocol DetailInteractorToPresenterProtocol: AnyObject {
   
}

protocol DetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
    
}


protocol DetailViewToPresenterProtocol: AnyObject {
    var view: DetailPresenterToViewProtocol? { get set }
    var interactor:  DetailPresenterToInteractorProtocol? { get set }
    var router: DetailPresenterToRouterProtocol? { get set }
    var data: UserResult? { get set }
    
    func updateView()
}

protocol  DetailPresenterToRouterProtocol: AnyObject {
    static func  createModule(data: UserResult) -> UIViewController
   
}
