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
    @IBOutlet weak var selectedItemLabel: UILabel!
    
    
    var modelList = CarouselElement.createListOfObjects()
    fileprivate let carouselCellIdentifier = "carouselCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarousel()
    }
    
    fileprivate func configureCarousel() {
        
        // We can do this also in the xib file, but here es more visible
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0

        carouselView.collectionViewLayout = flowLayout
        carouselView.showsHorizontalScrollIndicator = false
        carouselView.showsVerticalScrollIndicator = false
        carouselView.isPagingEnabled = true
        carouselView.allowsMultipleSelection = false
        
        carouselView.delegate = self
        carouselView.dataSource = self
    
        
        carouselView.register(UINib(nibName: "CarouselCell", bundle: nil), forCellWithReuseIdentifier: carouselCellIdentifier)
    }
    
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = modelList[indexPath.row]
        selectedItemLabel.text = model.label + " " + model.emogi
    }

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
    
    // MARK: Actions
    
    
    @IBAction func defaultListButtonAction() {
        changeModelList(CarouselElement.createListOfObjects() )
    }
    @IBAction func alternativeListButtonAction() {
        changeModelList(CarouselElement.createListOfObjects_Alt() )
    }
    
    // MARK: Others
    
    fileprivate func changeModelList(_ modelList: Array<CarouselElement>) {
        self.modelList = modelList
        carouselView.reloadData()
    }
    
}

