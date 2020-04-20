//
//  ViewController.swift
//  MapDirections
//
//  Created by Hugo Flores Perez on 4/20/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "Hola"
        view.backgroundColor = .white
        view.addSubview(myLabel)
        myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}

