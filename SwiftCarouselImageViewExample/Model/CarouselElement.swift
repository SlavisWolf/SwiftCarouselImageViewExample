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
                            imageUrl: "http://wallpaper-gallery.net/single/hd-birds-wallpapers/hd-birds-wallpapers-19.html"),
            
            CarouselElement(label: "Atardecer agradable",
                            emogi: "😌",
                            imageUrl: "BAD IMAGE")
        ]
    }
}
