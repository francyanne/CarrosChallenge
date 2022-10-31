//
//  CarsTableViewCell.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    // MARK: Properties
    var model: Cars?
    
    // MARK: Outlets
    @IBOutlet weak var imageCars: UIImageView!
    @IBOutlet weak var labelNameCars: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupUI() {
        labelNameCars.text = "AAAA"
    }
}
