//
//  SplashViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/16/25.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150) 
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let loginVC = LoginViewController()
            let nav = UINavigationController(rootViewController: loginVC)
            nav.modalPresentationStyle = .fullScreen
            UIApplication.shared.windows.first?.rootViewController = nav
        }
    }
}
