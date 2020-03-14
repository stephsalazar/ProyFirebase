//
//  CentralViewController.swift
//  ProyFirebase
//
//  Created by Stephany Salazar on 13/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

class CentralViewConytroller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        tabBar.tintColor = .black
        
        let ProfileController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as?  ProfileViewController
        
        ProfileController!.tabBarItem.title = "Perfil"
        ProfileController!.tabBarItem.image = UIImage(systemName: "person.fill")
        
        
        let PhotosController = UINavigationController(rootViewController: ProfileViewController())
        PhotosController.tabBarItem.title = "Fotos"
        PhotosController.tabBarItem.image = UIImage(systemName: "doc.richtext")
        
        let SaveController = UINavigationController(rootViewController: ProfileViewController())
        SaveController.tabBarItem.title = "Favoritos"
        SaveController.tabBarItem.image = UIImage(systemName: "tray.and.arrow.down.fill")

        
        
        viewControllers = [
            ProfileController!,
            PhotosController,
            SaveController
        ]
    }
    
    
}
