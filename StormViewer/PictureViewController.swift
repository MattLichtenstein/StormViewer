//
//  PictureViewController.swift
//  StormViewer
//
//  Created by Matt Lichtenstein on 1/14/20.
//  Copyright © 2020 Matt Lichtenstein. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    var imageView = UIImageView()
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setImage()
    }
    
    func setupImageView() {
        setImage()
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
        ])
    }
    
    func setImage() {
            title = selectedImage
            imageView.image = UIImage(named: selectedImage!)!
    }

}
