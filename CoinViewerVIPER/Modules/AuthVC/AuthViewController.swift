//
//  AuthViewController.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class AuthViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    //MARK: - Properties
    var presenter: ViewToPresenterAuthProtocol?
    
    // MARK: - Actions
    @objc func authorizationButtonTapped() {
        //проверка на содержание полей
            presenter?.authButtonTapped(login: loginTextField.text!, password: passwordTextField.text!)
    }
    
    func showAlert() {
        let ac = UIAlertController(title: "Error", message: "Enter correct login (1234) and password (1234)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(ac, animated: true)
    }
    
    let loginTextField: UITextField = {
        let view = UITextField()
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.placeholder = "Login"
        view.textAlignment = .center
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.autocorrectionType = UITextAutocorrectionType.no
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.clearButtonMode = UITextField.ViewMode.whileEditing;
        return view
    }()
    
    let passwordTextField: UITextField = {
        let view = UITextField()
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.placeholder = "Password"
        view.textAlignment = .center
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.autocorrectionType = UITextAutocorrectionType.no
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.clearButtonMode = UITextField.ViewMode.whileEditing;
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var authorizationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .label
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        button.addTarget(self, action: #selector(authorizationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, authorizationButton])
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension AuthViewController: PresenterToViewAuthProtocol { }

// MARK: - UI Setup
extension AuthViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: margins.topAnchor)
        ])
    }
}
