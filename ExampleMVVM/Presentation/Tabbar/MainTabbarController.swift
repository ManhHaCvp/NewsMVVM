//
//  MainTabbarController.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/16/25.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        let border = CALayer()
        border.name = "BottomBorder"
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5)
        tabBar.layer.addSublayer(border)
    }
    
    private func setupTabs() {
        
        let homeVC = HomePageViewController()
        let bookmarkVC = BookMarkViewController()
        let exploreVC = ExploreViewController()
        let profileVC = ProfileViewController()
        

        let homeNav = UINavigationController(rootViewController: homeVC)
        let bookmarkNav = UINavigationController(rootViewController: bookmarkVC)
        let exploreNav = UINavigationController(rootViewController: exploreVC)
        let profileNav = UINavigationController(rootViewController: profileVC)

        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        exploreNav.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        bookmarkNav.tabBarItem = UITabBarItem(title: "Bookmark", image: UIImage(systemName: "bookmark"), tag: 2)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 3)

        viewControllers = [homeNav, exploreNav, bookmarkNav, profileNav]
    }
}
