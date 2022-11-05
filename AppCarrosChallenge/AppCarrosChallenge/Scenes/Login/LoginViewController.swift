//
//  LoginViewController.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 28/10/22.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: Properties
    var viewModel = LoginViewModel()
    var animation = ProgressView()
    var hasSelected = true
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLogin: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonKeepLogged: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: Methods
    private func setupUI() {
        buttonLogin.layer.cornerRadius = 5
        textFieldLogin.borderStyle = .none
        textFieldPassword.borderStyle = .none
        textFieldPassword.isSecureTextEntry = true
        hasSelected = false
        buttonKeepLogged.setImage(UIImage(systemName: "square"), for: .normal)
    }
    
    private func goToCarsScene() {
        let carsViewController = CarsViewController()
        navigationController?.pushViewController(carsViewController, animated: true)
    }
    
    private func forgotPasswordScene() {
        let forgotPassword = ForgotPasswordViewController()
        forgotPassword.modalPresentationStyle = .overFullScreen
        present(forgotPassword, animated: true)
    }
    
    private func verifyIfIsMarked() {
        if hasSelected {
            SessionManager.shared.login = textFieldLogin.text
            SessionManager.shared.password = textFieldPassword.text
        }
    }
    
    private func checkIfTextFieldIsFill() {
        if textFieldLogin.text == "" || textFieldPassword.text == "" {
            showAlert(title: "Erro", message: "Preencha todos os campos.")
        } else {
            animation.startAnimation(animation: "car", frame: view.bounds, center: view.center)
        }
    }
    
    private func setUserSession(hasSession: Bool) {
        hasSession ? buttonKeepLogged.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal) : buttonKeepLogged.setImage(UIImage(systemName: "square"), for: .normal)
    }
    
    // MARK: Actions
    @IBAction func handlerButtonForgotPassword(_ sender: Any) {
        forgotPasswordScene()
    }
    
    @IBAction func handlerButtonLogin(_ sender: Any) {
        checkIfTextFieldIsFill()
        view.addSubview(animation.animationView)
        viewModel.postLogin(user: textFieldLogin.text ?? "", password: textFieldPassword.text ?? "") { [weak self] completion in
            DispatchQueue.main.async {
                if completion {
                    self?.animation.stopAnimation()
                    self?.goToCarsScene()
                    self?.verifyIfIsMarked()
                } else {
                    self?.animation.stopAnimation()
                    self?.showAlert(title: "Erro", message: "Login ou senha invalidos")
                }
            }
        }
    }
    
    @IBAction func handlerButtonKeepLogged(_ sender: Any) {
        hasSelected.toggle()
        print(hasSelected)
        setUserSession(hasSession: hasSelected)
    }
}
