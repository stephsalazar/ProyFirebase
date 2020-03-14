//
//  mainViewController.swift
//  ProyFirebase
//
//  Created by Daniel Barcenas on 3/7/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isLogged()
    }
    
    func isLogged(){
        Auth.auth().addStateDidChangeListener{ (auth,user) in
            if user == nil{
                print("usuario no loggeado")
                return
            }else{
                print("usuario logeado")
                self.performSegue(withIdentifier: "WelcomeView", sender: self)
            }
            
        }
    }
    

  
}
