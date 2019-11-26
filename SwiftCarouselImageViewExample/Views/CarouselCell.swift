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
    @IBOutlet weak var emogiLabel: UILabel!
    
    var model : CarouselElement?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell() {
        footLabel.text = model?.label
        emogiLabel.text = model?.emogi
    }
    
    fileprivate func downloadImage() {
        
        let queue = DispatchQueue(label: "imageDownloadQueue")
        
        queue.async {
            let image : UIImage
            do {
                let url = URL(fileURLWithPath: self.model?.imageUrl ?? "")
                let imageData = try Data(contentsOf: url)
                image = UIImage(data: imageData) ?? UIImage(imageLiteralResourceName: "fondo_defecto")
            }
            catch {
                image = UIImage(imageLiteralResourceName: "fondo_defecto")
                print("No se ha podido cargar la imagen")
            }
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }

}
