//
//  ViewController.swift
//  TheArena
//
//  Created by Eugene Krapivenko on 23.08.2021.
//

import UIKit

protocol LoadingData {
    func onSuccess<View>(type: View.Type, name: String) where View: UIViewController
}

class LoginViewController: UIViewController, LoadingData {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    private var alertWindow: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
    private var showRestoreButton: Bool = false {
        didSet {
            restoreButton.isHidden = !showRestoreButton
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        loginInput.text = "login"
        passwordInput.text = "password"
    }
    
    @IBAction func onLoginClick(_ sender: UIButton) {
        self.validate(login: loginInput.text ?? "", password: passwordInput.text ?? "") { error, result in
            if (result) {
                loadingNextView(type: GameViewController.self, name: "GameViewController")
            } else {
                showRestoreButton = true
            }
        }
    }
    
    @IBAction func onRestorePasswordClick(_ sender: UIButton) {
        showRestoreButton = false
        loadingNextView(type: RestoreViewController.self, name: "RestoreViewController")
    }
    
    private func validate(login: String, password: String, completion: ((Error?, Bool) -> Void)) {
        getAuth(login: login, password: password) { [self] session, error in
            DispatchQueue.main.async {
                if let message = error {
                    self.onNetworkError(message)
                } else {
                    self.loadingNextView(type: GameViewController.self, name: "GameViewController")
                }
            }
        }
    }
    
    private func onNetworkError(_ message: String) {
        alertWindow.title = "Ошибка сети"
        alertWindow.message = message
        alertWindow.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
            self?.alertWindow.removeFromParent()
        }))
        self.present(alertWindow, animated: false, completion: nil)
    }
    
    private func loadingNextView<View>(type: View.Type, name: String) where View: UIViewController {
        
        guard let nextView = storyboard?.instantiateViewController(identifier: "LoadingViewController") as? LoadingViewController else { return }
        nextView.action = { [self] in
            onSuccess(type: View.self, name: name)
        }
        
        self.navigationController?.pushViewController(nextView, animated: false)
    }
    
    internal func onSuccess<View>(type: View.Type, name: String) where View: UIViewController {
        
        guard let nextView = storyboard?.instantiateViewController(identifier: name) as? View else { return }
        
        self.navigationController?.pushViewController(nextView, animated: false)
    }
}
