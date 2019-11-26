//
//  ViewController.swift
//  SwiftCarouselImageViewExample
//
//  Created by Antonio Jesús on 26/11/2019.
//  Copyright © 2019 Antonio Jesús. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    
    
    
    

    
    @IBOutlet weak var carouselView: UICollectionView!
    
    let modelList = CarouselElement.createListOfObjects()
    fileprivate let carouselCellIdentifier = "carouselCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarousel()
    }
    
    fileprivate func configureCarousel() {
        
        carouselView.allowsMultipleSelection = false
        carouselView.delegate = self
        carouselView.dataSource = self
        carouselView.register(CarouselCell.self, forCellWithReuseIdentifier: carouselCellIdentifier)
//        carouselView.register(UINib(nibName: "CarouselCell.xib", bundle: nil), forCellWithReuseIdentifier: carouselCellIdentifier)
    }
    
    
    // MARK: UICollectionViewDelegate

    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CarouselCell = collectionView.dequeueReusableCell(withReuseIdentifier: carouselCellIdentifier, for: indexPath) as! CarouselCell
        cell.model = modelList[indexPath.row]
        cell.configureCell()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }

}

