//
//  SettingsViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/6/25.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


    @IBAction func NotificationButtonTapped(_ sender: Any) {
        let notiVC = NotificationViewController()
        navigationController?.pushViewController(notiVC, animated: true)
    }

    @IBAction func modeSwitchToggled(_ sender: UISwitch) {
        let isDark = sender.isOn
        UserDefaults.standard.set(isDark, forKey: "isDarkMode")

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.overrideInterfaceStyleGlobally(isDark ? .dark : .light)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
