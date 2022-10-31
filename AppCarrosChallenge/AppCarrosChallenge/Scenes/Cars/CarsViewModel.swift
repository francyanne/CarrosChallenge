//
//  CarsViewModel.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import Foundation

class CarsViewModel {
    
    var didSuccess: ((Cars) -> Void)?
    var didFailure: ((APIError) -> Void)?
    
    let tokenAccess = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNjY4MTAzNjEwLCJyb2wiOlsiUk9MRV9VU0VSIl19.Mo2bpTuzx3KbnlJMUC7GGjfd1hnQmSiuFuMLAVO1I2nAfrUfetBypDFa4CfmNOHZg1WwarqbPRdrLcTSumv4IQ"
    
    private func getCarsRequest(completion: @escaping ((Result<Cars, Error>) -> Void)) {
        guard let url = URL(string: "https://carros-springboot.herokuapp.com/api/v2/carros") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["Authorization":"Bearer \(tokenAccess)"]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard let data = data else {
                completion(.failure(APIError.badData))
                return
            }
            do {
                let cars = try JSONDecoder().decode(Cars.self, from: data)
                SessionManager.shared.name = cars[1].nome
                print(SessionManager.shared.name = cars[1].nome)
                completion(.success(cars))
                print(cars)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func getCars() {
        getCarsRequest { [weak self] result in
            switch result {
            case .success(let success):
                self?.didSuccess?(success)
            case .failure(let failure):
                self?.didFailure?(failure as! APIError)
            }
        }
    }
}
