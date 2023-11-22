//
//  UIView.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 22/11/23.
//


import Foundation
import UIKit

public extension UIView {
    func addShadow(_ color: CGColor = UIColor.lightGray.cgColor, _ shadowRadius: CGFloat = 2.0, _ shadowOpacity: Float = 0.5, _ cornerRadius: CGFloat =  0.0 ) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = color
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach({ self.addSubview($0) })
    }
    
    func addGradient(colours: [UIColor]) -> Void {
        self.addGradient(colours: colours, locations: nil)
    }
    
    func addGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addNewShadow(shadowColor: UIColor, shadowRadius: CGFloat = 8, height: CGFloat = 1.0) {
        self.clipsToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 0, height: height)
        self.layer.shadowRadius = shadowRadius
    }
}
