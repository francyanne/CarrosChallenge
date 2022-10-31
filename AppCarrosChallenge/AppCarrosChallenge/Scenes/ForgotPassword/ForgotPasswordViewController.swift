//
//  ForgotPasswordViewController.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonSend: UIButton!
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setNavigationBarStyle()
    }
    
    // MARK: Methods
    private func setupUI() {
        textFieldLoginEmail.borderStyle = .none
    }
    
    private func setNavigationBarStyle() {
        let appearence = UINavigationBarAppearance()
        if #available(iOS 15, *) {
            appearence.configureWithOpaqueBackground()
            appearence.backgroundColor = .gray
            //            appearence.titleTextAttributes = textAttributes
            navigationController?.navigationBar.standardAppearance = appearence
            navigationController?.navigationBar.scrollEdgeAppearance = appearence
            navigationController?.navigationBar.barTintColor = .gray
            navigationController?.navigationBar.backgroundColor = . gray
        }
    }
    
    // MARK: Actions
    @IBAction func handlerButtonCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func handlerButtonSend(_ sender: Any) {
    }
}
