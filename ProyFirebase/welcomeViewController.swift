//
//  welcomeViewController.swift
//  ProyFirebase
//
//  Created by Daniel Barcenas on 3/7/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase

class welcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signOut(_ sender: Any){
       var salida = try! Auth.auth().signOut()
        navigationController?.popViewController(animated: true)
        
        
        
    }
    

    

}
