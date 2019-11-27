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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var model : CarouselElement? {
        didSet {
            DispatchQueue.main.async {
                self.configureCell()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell() {
        resetCell()
        if(model?.image == nil) {
            modelDownloadImage()
        }
        else{
            fillViewsWithModel()
        }
    }
    
   fileprivate func fillViewsWithModel() {
        imageView.image = model?.image
        footLabel.text = model?.label
        emogiView.text = model?.emogi
    }
    
   fileprivate func resetCell() {
        activityIndicator.startAnimating()
        footLabel.text = nil
        emogiView.text = nil
        imageView.image = nil
        
    }
    
    
    fileprivate func modelDownloadImage() {
        ImageDownloader.downloadImage(imageUrl: model?.imageUrl ?? "") { (downloadedImage) in
            self.model?.image = downloadedImage
            DispatchQueue.main.async {
                self.fillViewsWithModel()
            }
        }
    }
}
