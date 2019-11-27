//
//  ImageDownloader.swift
//  SwiftCarouselImageViewExample
//
//  Created by Antonio Jesús on 27/11/2019.
//  Copyright © 2019 Antonio Jesús. All rights reserved.
//

import UIKit

class ImageDownloader {

    static func downloadImage(imageUrl: String, callback: @escaping (_ image : UIImage) -> Void) {
        
        enum ValidationError: Error {
            case invalidUrl
        }
        
        let queue = DispatchQueue(label: "imageDownloadQueue")
        
        queue.async {
            
            let downloadedImage : UIImage
            do {
                
                guard let url : URL = URL(string: imageUrl ) else {
                    throw ValidationError.invalidUrl
                }

                let imageData = try Data(contentsOf: url  )
                downloadedImage = UIImage(data: imageData) ?? ImageDownloader.defaultValueForImage()
            }
            catch {
                downloadedImage = ImageDownloader.defaultValueForImage()
            }
            
            callback(downloadedImage)
        }
    }
    
    static fileprivate func defaultValueForImage () -> UIImage {
        return UIImage(imageLiteralResourceName: "fondo_defecto")
    }
}
