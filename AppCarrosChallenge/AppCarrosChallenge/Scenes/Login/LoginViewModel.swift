//
//  LoginViewModel.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 28/10/22.
//

import Foundation

class LoginViewModel {
    func postLogin(user: String, password: String, completion: @escaping ((Bool) -> Void)) {
        guard let url = URL(string: "https://carros-springboot.herokuapp.com/api/v2/login") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        let body = LoginModel(username: user, password: password)
        do {
            let jsonBody = try JSONEncoder().encode(body)
            request.httpBody = jsonBody
        } catch {
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    completion(true)
                default:
                    completion(false)
                }
            }
            
            guard let data = data else { return }
            guard let loginModel = try? JSONDecoder().decode(LoginResponseModel.self, from: data) else { return }
            
        }.resume()
    }
}
