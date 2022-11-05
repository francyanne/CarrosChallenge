//
//  DetailViewController.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    // MARK: Properties
    var selectedImage: String?
    var navigationTitle: String?
    
    // MARK: Outlet
    @IBOutlet weak var imageCar: UIImageView!
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCar.sd_setImage(with: URL(string: selectedImage ?? ""))
        setupNavigationItems()
        title = navigationTitle
        navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: Methods
    private func setupNavigationItems() {
        let mapImage = UIImage(systemName: "location.fill")
        let videoImage = UIImage(systemName: "video.fill")
        let mapButton = UIBarButtonItem(image: mapImage,  style: .plain, target: self, action: #selector(didTapEditButton))
        let videoButton = UIBarButtonItem(image: videoImage,  style: .plain, target: self, action: #selector(didTapSearchButton))
        navigationItem.rightBarButtonItems = [videoButton, mapButton]
        mapButton.tintColor = .white
        videoButton.tintColor = .white
    }
    
    private func backBarButton() {
        if #available(iOS 15, *) {
            navigationItem.backBarButtonItem?.image = UIImage(named: "arrow")
            navigationItem.backBarButtonItem?.tintColor = .white
        }
    }
    
    @objc func didTapEditButton() {
        showAlert(title: "Ops...", message: "Seção em construção!")
    }
    
    @objc func didTapSearchButton() {
        showAlert(title: "Ops...", message: "Seção em construção!")
    }
}
