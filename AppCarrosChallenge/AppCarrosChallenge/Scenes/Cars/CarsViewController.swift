//
//  CarsViewController.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 30/10/22.
//

import UIKit
import SDWebImage

class CarsViewController: UIViewController {
    // MARK: Properties
    let viewModel = CarsViewModel()
    let loginViewController = LoginViewController()
    var model: Cars?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCars()
        bindEvents()
        setupTableView()
        setupNavigationBar()
        setRightNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Carros"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    // MARK: Methods
    private func setupNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 21)]
        let appearence = UINavigationBarAppearance()
        if #available(iOS 15, *) {
            appearence.configureWithOpaqueBackground()
            appearence.backgroundColor = .greenApp
            appearence.titleTextAttributes = textAttributes
            navigationController?.navigationBar.standardAppearance = appearence
            navigationController?.navigationBar.scrollEdgeAppearance = appearence
            navigationController?.navigationBar.barTintColor = .greenApp
            navigationItem.hidesBackButton = true
        }
    }
    
    private func bindEvents() {
        viewModel.didSuccess = { [weak self] model in
            self?.model = model
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.didFailure = { [weak self] _ in
            DispatchQueue.main.async {
                self?.showAlert(title: "Erro", message: "Oops... Algo deu errado.")
            }
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CarsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func setRightNavigationItem() {
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(logoutUser))
        navigationItem.rightBarButtonItem  = logoutBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    // MARK: ObjcMethods
    @objc func logoutUser() {
        let alert = UIAlertController(title: "Sair",
                                      message: "Tem certeza que deseja sair?",
                                      preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancelar", style: .default)
        alert.addAction(UIAlertAction(title: "Sair", style: .default, handler: { alert in
            SessionManager.shared.clearSession()
            AppDelegate.setRootViewController(controller: LoginViewController(), animated: true)
        }))
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension CarsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController()
        detail.navigationTitle = model?[indexPath.row].nome
        detail.selectedImage = model?[indexPath.row].urlFoto
        navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 20

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.shadowColor = UIColor.black.cgColor
        maskLayer.borderWidth = 1
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CarsTableViewCell {
            cell.labelNameCars.text = model?[indexPath.row].nome
            cell.imageCars.sd_setImage(with: URL(string: model?[indexPath.row].urlFoto ?? ""))
            return cell
        }
        return UITableViewCell()
    }
}
