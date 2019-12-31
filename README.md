# MemoryLeak
Project to show how so easy is to generate a memory leak on your app if don't know about Strong and Weak references. I thank Chris Adamson and Professor Norberto to explain the meaning of the code.

# PictureViewController

``` swift 
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
```

# PictureViewModel

``` swift 
//
//  PictureViewModel.swift
//  MemoryLeakDemo
//
//  Created by Chris Adamson on 7/16/17.
//  Copyright © 2017 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit

protocol PictureViewModelDelegate: class {
    func modelDidLoadPicture(_ model: PictureViewModel)
}

class PictureViewModel {

    private (set) var image: UIImage?
    private var imageData: Data?
    weak var delegate: PictureViewModelDelegate?
    
    func loadImage() {
        guard let imageURL = Bundle.main.url(forResource: "bundle-image", withExtension: "jpg") else { return }
        do {
            let imageData = try Data(contentsOf: imageURL)
            if let image = UIImage(data: imageData) {
                self.imageData = imageData
                self.image = image
                self.delegate?.modelDidLoadPicture(self)
            }
        } catch {
            print ("couldn't load image data: \(error)")
        }
    }
}


```
