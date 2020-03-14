//
//  ViewController.swift
//  ProyFirebase
//
//  Created by Daniel Martinez velazquez on 06/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var emailLTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lasNameTF: UITextField!
    
//    ref me ayudara a llegar a mi coleccion de la base de datos, y la segunda para poder manipular mis documentos
    var ref: DocumentReference!
    var getRef: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getRef = Firestore.firestore()
    }
    
    @IBAction func createUeser(_ sender:UIButton){
        guard let email = emailLTF.text, email != "", let password = passwdTF.text, password != "", let name = nameTF.text, name != "", let lastName = lasNameTF.text, lastName != "" else{
            print("Falta algun dato")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            print("usuario creado",user?.user.uid)
            self.storeUser(uid: (user?.user.uid)!, name: name, lastName: lastName)
        }
    }
    
    @IBAction func cancel(_ sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    func showMessage(message: String){
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController,animated: true)
    }
    
    func storeUser(uid: String, name: String, lastName: String){
//        REcibira cualqioer cosa
        var data: [String: Any] = ["name": name, "lastname": lastName]
        
//        Firestore.firestore().collection("items").document("yourId").setData(comple)
        
        getRef.collection("users").document(uid).setData(data, completion: { (error) in
            if let error = error{
                self.showMessage(message: error.localizedDescription)
                return
            }else{
                print("Datos guardados")
            }
        })
//        Una referencia una vez que me conecte a la base de datos
//        ref = getRef.collection("users").addDocument(data: data, completion: { (error) in
//            if let error = error{
//                self.showMessage(message: error.localizedDescription)
//                return
//            }else{
//                print("Datos Guardados")
//            }
//        })
    }
    
}

