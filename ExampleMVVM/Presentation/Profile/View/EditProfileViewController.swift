//
//  EditProfileViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/6/25.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBAction func unsaveButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
