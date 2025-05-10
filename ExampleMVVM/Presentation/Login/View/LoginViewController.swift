    //
    //  LoginViewController.swift
    //  ExampleMVVM
    //
    //  Created by V002822 on 4/15/25.
    //

    import UIKit

    class LoginViewController: UIViewController {
    //    private var isRememberMeSelected: Bool = false
        private var isPasswordVisible = false
        private var viewModel: LoginViewModel!

        @IBOutlet weak var Login: UIButton!
        @IBOutlet weak var Google: UIButton!
        @IBOutlet weak var Facebook: UIButton!
        
        @IBOutlet weak var rememberMeButton: UIButton!
        @IBOutlet weak var usernameTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        @IBOutlet weak var usernameErrorLabel: UILabel!
        @IBOutlet weak var passwordErrorLabel: UILabel!

        private var isRememberMeSelected: Bool = false {
            didSet {
                if isRememberMeSelected {
                    rememberMeButton.tintColor = .systemBlue
                    rememberMeButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
                } else {
                    rememberMeButton.tintColor = .lightGray
                    rememberMeButton.setImage(UIImage(systemName: "square"), for: .normal)
                }
            }
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            usernameErrorLabel.isHidden = true
            passwordErrorLabel.isHidden = true
            
            //Eye button show password
            let eyeButton = UIButton(type: .custom)
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            eyeButton.tintColor = .gray
            eyeButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 24))
            eyeButton.center = paddingView.center
            paddingView.addSubview(eyeButton)

            passwordTextField.rightView = paddingView
            passwordTextField.rightViewMode = .always

            // MARK: DESIGN
            rememberMeButton.backgroundColor = .clear
            isRememberMeSelected = false

            Login.layer.cornerRadius = 5
            Login.layer.backgroundColor = UIColor.systemBlue.cgColor
            Login.titleLabel?.textColor = UIColor.white
         
            if #available(iOS 13.0, *) {
                Facebook.layer.backgroundColor = UIColor.systemGray6.cgColor
            } else {
            }
            Facebook.titleLabel?.textColor = UIColor.black
            Facebook.layer.cornerRadius = 5
            
            if #available(iOS 13.0, *) {
                Google.layer.backgroundColor = UIColor.systemGray6.cgColor
            } else {
            }
            Google.titleLabel?.textColor = UIColor.black
            Google.layer.cornerRadius = 5

            //Logic with MockData
            let mockDataSource = MockLoginRemoteDataSource()
            let repo = LoginRepositoryImpl(remoteDataSource: mockDataSource)
            let useCase = LoginUseCaseImpl(loginRepository: repo)
            let userRepo = UserInfoRepositoryImpl(remoteDataSource: mockDataSource)
            let userInfoUseCase = GetUserInfoUseCaseImpl(inforRepository: userRepo)
            
            viewModel = LoginViewModel(
                loginUseCase: useCase,
                getUserInfoUseCase: userInfoUseCase
            )
            
            bindViewModel()
            
            viewModel.getUserInfo()
        }

        private func bindViewModel() {
            viewModel.username.observe(on: self) { [weak self] username in
                guard let self = self else { return }
                if self.usernameTextField.text != username {
                    self.usernameTextField.text = username
                }
            }

            viewModel.password.observe(on: self) { [weak self] password in
                guard let self = self else { return }
                if self.passwordTextField.text != password {
                    self.passwordTextField.text = password
                }
            }

            viewModel.rememberMe.observe(on: self) { [weak self] rememberMe in
                guard let self = self else { return }
                if self.isRememberMeSelected != rememberMe {
                    self.isRememberMeSelected = rememberMe

                }
            }

            viewModel.isLoginSuccess.observe(on: self) { [weak self] isSuccess in
                guard isSuccess else { return }
                let tabbar = MainTabbarController()
                tabbar.modalPresentationStyle = .fullScreen
                self?.present(tabbar, animated: true)
            }
            
    //        viewModel.errorPasswordMessage.observe(on: self) { [weak self] message in
    //            guard let message = message else { return }
    //            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "OK", style: .default))
    //            self?.present(alert, animated: true)
    //       }
        }
        
        // MARK: Login
        @IBAction func loginButtonTapped(_ sender: UIButton) {
            let username = viewModel.username.value ?? ""
            let password = viewModel.password.value ?? ""

            // Hide error messages
            usernameErrorLabel.isHidden = true
            passwordErrorLabel.isHidden = true
            usernameTextField.layer.borderColor = UIColor.clear.cgColor
            passwordTextField.layer.borderColor = UIColor.clear.cgColor

            var hasError = false

            // Both empty
            if username.isEmpty && password.isEmpty {
                usernameErrorLabel.isHidden = false
                usernameErrorLabel.text = "Invalid username !"
                usernameTextField.layer.borderColor = UIColor.red.cgColor
                usernameTextField.layer.borderWidth = 1.0
                usernameTextField.layer.cornerRadius = 6
                usernameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.1)

                passwordErrorLabel.isHidden = false
                passwordErrorLabel.text = "Invalid password !"
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                passwordTextField.layer.borderWidth = 1.0
                passwordTextField.layer.cornerRadius = 6
                passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.1)

                hasError = true
            } else {
                // Only username empty
                if username.isEmpty {
                    usernameErrorLabel.isHidden = false
                    usernameErrorLabel.text = "Invalid username !"
                    usernameTextField.layer.borderColor = UIColor.red.cgColor
                    usernameTextField.layer.borderWidth = 1.0
                    usernameTextField.layer.cornerRadius = 6
                    usernameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.1)

                    hasError = true
                }

                // Only password empty
                if password.isEmpty {
                    passwordErrorLabel.isHidden = false
                    passwordErrorLabel.text = "Invalid password !"
                    passwordTextField.layer.borderColor = UIColor.red.cgColor
                    passwordTextField.layer.borderWidth = 1.0
                    passwordTextField.layer.cornerRadius = 6
                    passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.1)

                    hasError = true
                }
            }

            if hasError { return }

            // Login
            viewModel.login()
        }
        
        // Button Tapped
        @IBAction func rememberMeButtonTapped(_ sender: UIButton) {
    //        isRememberMeSelected.toggle()
    //        viewModel.rememberMe.value = isRememberMeSelected
    //        updateRememberMeButton()
            
    //        viewModel.rememberMe.value.toggle()
            
            let current = viewModel.rememberMe.value
            viewModel.updateRememberMe(!current)
        }
        
        // Error typing
        @IBAction func textFieldDidBeginEditing(_ sender: UITextField) {
            if sender == usernameTextField {
                usernameErrorLabel.isHidden = true
                usernameTextField.layer.borderColor = UIColor.clear.cgColor
                usernameTextField.backgroundColor = UIColor.white
            } else if sender == passwordTextField {
                passwordErrorLabel.isHidden = true
                passwordTextField.layer.borderColor = UIColor.clear.cgColor
                passwordTextField.backgroundColor = UIColor.white
            }
        }
        
        @IBAction func textFieldDidChanged(_ sender: UITextField) {
            if sender == usernameTextField {
                viewModel.updateUsername(usernameTextField.text ?? "")
            } else if sender == passwordTextField {
                viewModel.updatePassword(passwordTextField.text ?? "")
            }
        }

        // Show password
        @objc func togglePasswordVisibility() {
            isPasswordVisible.toggle()
            passwordTextField.isSecureTextEntry = !isPasswordVisible

            // Swap icon
            if let button = passwordTextField.rightView as? UIButton {
                let imageName = isPasswordVisible ? "eye" : "eye.slash"
                button.setImage(UIImage(systemName: imageName), for: .normal)
            }
        }
    }
