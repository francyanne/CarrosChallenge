//
//  CarsTableViewCell.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    // MARK: Properties
    let loginViewController = LoginViewController()
    var model: Cars?
    
    // MARK: Outlets
    @IBOutlet weak var imageCars: UIImageView!
    @IBOutlet weak var labelNameCars: UILabel!
}
