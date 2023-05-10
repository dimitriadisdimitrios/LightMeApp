//
//  StringExtensions.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 10/5/23.
//

import Foundation

extension String {
    func temperature() -> String {
        let intText = (self as NSString).floatValue
        return "\(Int(intText)) °C"
    }
    
    func humidity() -> String {
        if let intText = Int(self) {
            return "\(intText) %"
        }
        return "? %"
    }
}
