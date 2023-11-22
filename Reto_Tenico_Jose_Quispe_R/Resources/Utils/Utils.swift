//
//  Utils.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 22/11/23.
//

import Foundation


func configure<T>(_ value: T, with closure: (inout T) -> Void) -> T {
    var value = value
    closure(&value)
    return value
}

