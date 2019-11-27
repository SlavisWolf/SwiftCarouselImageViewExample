//
//  CarouselCell.swift
//  SwiftCarouselImageViewExample
//
//  Created by Antonio Jesús on 26/11/2019.
//  Copyright © 2019 Antonio Jesús. All rights reserved.
//

import UIKit

class CarouselCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var footLabel: UILabel!
    @IBOutlet weak var emogiView: UILabel!
    
    
    var model : CarouselElement?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        footLabel.text = model?.label
        emogiView.text = model?.emogi
        downloadImage()
    }
    
    // MARK:  Image Functions
    fileprivate func downloadImage() {
        
        enum ValidationError: Error {
            case invalidUrl
        }
        
        let queue = DispatchQueue(label: "imageDownloadQueue")
        
        queue.async {
            
            let image : UIImage
            do {
                
                guard let url : URL = URL(string: self.model?.imageUrl ?? "") else {
                    throw ValidationError.invalidUrl
                }

                let imageData = try Data(contentsOf: url  )
                image = UIImage(data: imageData) ?? self.defaultValueForImage()
            }
            catch {
                image = self.defaultValueForImage()
            }
            
            self.loadImageInMainQueue(image)
        }
    }
    
    fileprivate func defaultValueForImage () -> UIImage {
        return UIImage(imageLiteralResourceName: "fondo_defecto")
    }
    
    fileprivate func loadImageInMainQueue (_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    

}
