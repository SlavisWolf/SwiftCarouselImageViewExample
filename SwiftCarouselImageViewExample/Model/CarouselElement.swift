//
//  CarouselElement.swift
//  SwiftCarouselImageViewExample
//
//  Created by Antonio Jesús on 26/11/2019.
//  Copyright © 2019 Antonio Jesús. All rights reserved.
//

import UIKit

struct CarouselElement {
    
    var label       : String
    var emogi       : String
    var imageUrl    : String
    var image       : UIImage?
    
    init(label: String, emogi: String, imageUrl : String) {
        self.label      = label
        self.emogi      = emogi
        self.imageUrl   = imageUrl
    }
    
    // MARK: Static methods
    static func createListOfObjects() -> Array<CarouselElement> {
        return  [
            CarouselElement(label: "Bosque encantado",
                            emogi: "😰",
                            imageUrl: "https://www.rezzcard.com/wp-content/uploads/2015/11/shutterstock_318655940-900x444.jpg"),
            
            CarouselElement(label: "Hermoso lago" ,
                            emogi: "💖",
                            imageUrl: "http://hdwpro.com/wp-content/uploads/2016/02/Nice-Beautiful-Wallpaper.jpeg"),
            
            CarouselElement(label: "Árboles rosados",
                            emogi: "😇",
                            imageUrl: "https://www.itl.cat/pics/b/21/216215_beautiful-wallpaper.jpg"),
            
            CarouselElement(label: "Pájaro feliz",
                            emogi: "😊",
                            imageUrl: "https://www.pixelstalk.net/wp-content/uploads/2016/04/Bird-wallpapers-HD-for-desktop-620x349.jpg"),
            
            CarouselElement(label: "Atardecer agradable",
                            emogi: "😌",
                            imageUrl: "BAD IMAGE")
        ]
    }
    
    static func createListOfObjects_Alt() -> Array<CarouselElement> {
        return  [
            CarouselElement(label: "Diosa de los mares",
                            emogi: "😍",
                            imageUrl: "https://www.wallpapers13.com/wp-content/uploads/2015/11/Beautiful-Dreaming-Fantasy-Girl-Artwork-Wallpaper-915x515.jpg"),
            
            CarouselElement(label: "Fresitas ricas" ,
                            emogi: "😋",
                            imageUrl: "https://pbs.twimg.com/media/Dd-251fV0AEInKq.jpg:large"),
            
            CarouselElement(label: "Lo más Kawai del universo",
                            emogi: "😻",
                            imageUrl: "https://www.desktopbackground.org/p/2014/08/20/812273_beautiful-wallpapers-for-facebook-500-collection-hd-wallpapers_1440x900_h.jpg"),
        ]
    }
}
