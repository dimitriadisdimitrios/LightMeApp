//
//  Message.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 10/5/23.
//

import Foundation

struct Message: Codable {
    let deviceId: String
    let siteId: String
    let humidity: Int
    let temperature: Double
}
