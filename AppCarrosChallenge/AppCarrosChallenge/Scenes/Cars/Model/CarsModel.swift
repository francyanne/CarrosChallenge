//
//  CarsModel.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import Foundation

//struct CarsModel: Decodable {
//    let cars: [CarsInfo]
//}
//
//struct CarsInfo: Decodable {
//    let id: Int
//    let nome: String
//    let tipo: String
//    let descricao: String
//    let urlFoto: String
//}

struct CarsInfo: Decodable {
    let id: Int
    let nome: String
    let urlFoto: String?
}

typealias Cars = [CarsInfo]
