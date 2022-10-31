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
    }
    
    private func goToCarsScene() {
        let carsViewController = CarsViewController()
        navigationController?.pushViewController(carsViewController, animated: true)
    }
    
    private func forgotPasswordScene() {
        let forgotPassword = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotPassword, animated: true)
    }
    
    // MARK: Actions
    @IBAction func handlerButtonForgotPassword(_ sender: Any) {
        forgotPasswordScene()
    }
    
    @IBAction func handlerButtonLogin(_ sender: Any) {
        animation.startAnimation(animation: "loginLoading", frame: view.bounds, center: view.center)
        view.addSubview(animation.animationView)
        viewModel.postLogin(user: textFieldLogin.text ?? "", password: textFieldPassword.text ?? "") { [weak self] completion in
            DispatchQueue.main.async {
                if completion {
                    self?.animation.stopAnimation()
                    self?.goToCarsScene()
                } else {
                    self?.animation.stopAnimation()
                }
            }
        }
    }
    
    @IBAction func handlerButtonKeepLogged(_ sender: Any) {
        
    }
}
