//
//  PhotoCollectionViewCell.swift
//  ProyFirebase
//
//  Created by Stephany Salazar on 14/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)) // CGRect =nCore Graphics Rectangule
        
        return pv
    
    }()
    
    override init(frame: CGRect) { // Métodos constructores (Equivalente a abrir la bibloteca de elementos en el interface Builder)
        super.init(frame: frame)
//        print("Pintando")
        addSubview(photoView) // Agregamos a la vista
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
