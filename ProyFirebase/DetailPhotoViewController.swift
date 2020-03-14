//
//  DetailPhotoViewController.swift
//  ProyFirebase
//
//  Created by Stephany Salazar on 14/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

class DetailPhotoViewController: UIViewController{
    
    var imagen: UIImage! = nil
    var userID: String!
    
    let photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect(x: 8, y: 8, width: 300, height: 300))
        
        return pv
    }()
    
    let saveButton: UIButton = {
        let b = UIButton(type: .system) // IBOUTLET
        b.setTitle("Descargar Imagen", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false // forma programatica para los contraints
        b.addTarget(self, action: #selector(savePhoto), for: .touchUpInside) // craer para interaccion (este es el agregarle el evento)(IBACTION)
        
        return b
    }()
    
    let favoritesButton: UIButton = {
        let b = UIButton(type: .system) // IBOUTLET
        b.setTitle("Agregar a favoritos", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false // forma programatica para los contraints
        b.addTarget(self, action: #selector(addPhotoToFavorites), for: .touchUpInside) // craer para interaccion (este es el agregarle el evento)(IBACTION)
        
        return b
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoView.image = imagen
        view.addSubview(photoView)
        view.addSubview(saveButton)
        view.addSubview(favoritesButton)
        photoView.center = view.center
        
        saveButton.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 10).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        favoritesButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10).isActive = true
        favoritesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    @objc func savePhoto(){ //Función que ejecuta el botón
        guard let imagen = photoView.image else { return } //obtenemos la foto, si no existe simplemente nos salimos
        
        
        // Nota para el futuro: Se va a necesitar pedir permiso al usuario (Abrir info.plist y agregar nueva fila agrgando "NSPhotoLibraryAddUsageDescription" mas el mensaje a mostrar)
        // en el selector metemos un metodo (funcion)
        UIImageWriteToSavedPhotosAlbum(imagen, nil, #selector(newImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func newImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        print("guardar")
        
        // esta funcion por el momento no se accede a ella, la creamos solo para cumplir con el parametro de UIImageWrite
    }
    
    @objc func addPhotoToFavorites(){ //Función que ejecuta el botón
        
        guard let imagen = photoView.image else { return } //obtenemos la foto, si no existe simplemente nos salimos
        
        let storageReference = Storage.storage().reference() // se conecta al storage y me da una referencia
        let userImageRef = storageReference.child("/favorites").child(userID) // creamos una carpeta para guardar las photos
        let uploadMetadata = StorageMetadata()
        
        
        
    }
}
