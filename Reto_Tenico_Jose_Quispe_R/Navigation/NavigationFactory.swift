//
//  NavigationFactory.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//


import UIKit

typealias  NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func Builder(rootview: UIViewController) -> UINavigationController {
        
        let navigationControler = UINavigationController(rootViewController: rootview)
        
        return navigationControler
    }
    
}

