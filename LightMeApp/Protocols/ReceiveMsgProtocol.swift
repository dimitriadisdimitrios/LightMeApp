//
//  ReceiveMsgProtocol.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 10/5/23.
//

import Foundation

protocol ReceiveMsgProtocol {
    func didReceiveMessage(topic: String , message: String?)
}
