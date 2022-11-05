//
//  CarsModel.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import Foundation

struct CarsInfo: Decodable {
    let id: Int
    let nome: String
    let urlFoto: String?
}

typealias Cars = [CarsInfo]
