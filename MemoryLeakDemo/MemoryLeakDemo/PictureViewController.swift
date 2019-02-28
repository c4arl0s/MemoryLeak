//
//  ViewController.swift
//  MemoryLeakDemo
//
//  Created by Chris Adamson on 7/16/17.
//  Copyright © 2017 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var model: PictureViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // create an instance of PictureViewModel
        model = PictureViewModel()
        // delega a PictureViewController
        model?.delegate = self
        // ejecuta el método loadImage de la instancia
        model?.loadImage()
    }
}
// Conforms protocol PictureViewModelDelegate
extension PictureViewController: PictureViewModelDelegate {
    func modelDidLoadPicture(_ model: PictureViewModel) {
        print ("modelDidLoadPicture")
        imageView.image = model.image
    }
    
}
