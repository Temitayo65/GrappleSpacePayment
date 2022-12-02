//
//  MainTabBarViewController.swift
//  GrappleSpace
//
//  Created by ADMIN on 29/11/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground
        
        let vc1: UINavigationController = UINavigationController(rootViewController: HomeViewController())
        let vc2: UINavigationController = UINavigationController(rootViewController: CourseViewController())
        let vc3: UINavigationController = UINavigationController(rootViewController: SearchViewController())
        let vc4: UINavigationController = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "note.text")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "person")
        
        vc1.tabBarItem.title = "Home"
        vc2.tabBarItem.title = "Courses"
        vc3.tabBarItem.title = "Search"
        vc4.tabBarItem.title = "Profile"
        
        
        tabBar.tintColor = .purple
        tabBar.barTintColor = .white
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

