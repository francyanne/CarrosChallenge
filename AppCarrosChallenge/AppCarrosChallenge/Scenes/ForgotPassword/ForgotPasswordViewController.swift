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
    }
    
    // MARK: Methods
    private func setupUI() {
        textFieldLoginEmail.borderStyle = .none
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    private func checkIfTextFieldIsFill() {
        if textFieldLoginEmail.text != "" {
            showAlert(title: "Ops...", message: "Tente novamente mais tarde.")
        } else {
            showAlert(title: "Erro", message: "Preencha o campo")
        }
    }
    
    // MARK: Actions
    @IBAction func handlerButtonCancel(_ sender: Any) {
        textFieldLoginEmail.text = ""
        dismiss(animated: true)
    }
    
    @IBAction func handlerButtonSend(_ sender: Any) {
        checkIfTextFieldIsFill()
    }
}
