//
//  LoginResponseModel.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import Foundation

struct LoginResponseModel: Decodable {
    let id: Int
    let login: String
    let nome: String
    let email: String
    let urlFoto: String
    let token: String
}

