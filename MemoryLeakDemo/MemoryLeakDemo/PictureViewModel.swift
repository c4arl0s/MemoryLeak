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
        guard let imageURL =
            Bundle.main.url(forResource: "bundle-image",
                            withExtension: "jpg") else { return }
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

