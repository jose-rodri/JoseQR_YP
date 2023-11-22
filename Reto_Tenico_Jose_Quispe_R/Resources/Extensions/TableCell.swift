//
//  TableCell.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 22/11/23.
//

import Foundation
import UIKit

public extension UITableView {
    /// Register a cell that conforms the ReusableView protocol
    /// - Parameter _: Class of  the cell to be registered
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableViewCell {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Dequeue a cell that conforms the ReusableView protocol
    /// - Parameter indexPath: indexPath of the cell
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

public protocol ReusableViewCell: AnyObject {
    /// Represents the reusesable identifier for a cell
    static var reuseIdentifier: String { get }
}

public extension ReusableViewCell where Self: UIView {
    /// Set the reuse identifier to be equal to the class name
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
