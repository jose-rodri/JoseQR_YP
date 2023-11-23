//
//  Utils.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 22/11/23.
//

import Foundation


func configure<T>(_ value: T, with closure: (inout T) -> Void) -> T {
    var value = value
    closure(&value)
    return value
}

