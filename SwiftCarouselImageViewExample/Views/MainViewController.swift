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
                                    UICollectionViewDataSourcePrefetching,
                                    UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var carouselView: UICollectionView!
    @IBOutlet weak var selectedItemLabel: UILabel!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    
    
    
    var modelList = CarouselElement.createListOfObjects()
    var carouselTimer : Timer?
    
    fileprivate let carouselCellIdentifier = "carouselCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarousel()
        configureCarouselPageControl()
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
        carouselView.prefetchDataSource = self
        carouselView.isPrefetchingEnabled = true
    
        
        carouselView.register(UINib(nibName: "CarouselCell", bundle: nil), forCellWithReuseIdentifier: carouselCellIdentifier)
    }
    
    fileprivate func configureCarouselPageControl() {
        carouselPageControl.numberOfPages = modelList.count
        carouselPageControl.currentPage = 0
    }
    
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = modelList[indexPath.row]
        selectedItemLabel.text = model.label + " " + model.emogi
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        for currenCell : UICollectionViewCell in carouselView.visibleCells {
            let currentCellIndexPath = carouselView.indexPath(for: currenCell)
            if(currentCellIndexPath != indexPath) {
                carouselPageControl.currentPage = currentCellIndexPath?.row ?? 0
            }
        }
    }

    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CarouselCell = collectionView.dequeueReusableCell(withReuseIdentifier: carouselCellIdentifier, for: indexPath) as! CarouselCell
        cell.model = modelList[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: UICollectionViewDataSourcePrefetching
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            var model = modelList[indexPath.row]
            if(model.image == nil) {
                ImageDownloader.downloadImage(imageUrl: model.imageUrl) { (imageDownloaded) in
                    model.image = imageDownloaded
                }
            }
        }
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
    
    @IBAction func carouselSwitchTimerAction(_ sender: UISwitch) {
        
        if(sender.isOn) {
            carouselTimer = Timer.scheduledTimer(timeInterval: 5.0,
                                                 target: self,
                                                 selector: #selector(carouselTimerNextImage),
                                                 userInfo: nil,
                                                 repeats: true)
        }
        else {
            carouselTimer?.invalidate()
            carouselTimer = nil
        }
            
    }
    
    // MARK: Timer Functions
    
     @objc fileprivate func carouselTimerNextImage() {
        var newIndex = carouselPageControl.currentPage + 1
        if(newIndex >= modelList.count) {
            newIndex = 0
        }
        carouselView.scrollToItem(at: IndexPath(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
        //carouselPageControl.currentPage = newIndex
    }
    
    // MARK: Others
    
    fileprivate func changeModelList(_ modelList: Array<CarouselElement>) {
        self.modelList = modelList
        carouselView.reloadData()
        carouselPageControl.numberOfPages = modelList.count
        carouselView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

