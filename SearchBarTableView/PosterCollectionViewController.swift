//
//  PosterCollectionViewController.swift
//  SearchBarTableView
//
//  Created by jesuschvz on 12/14/17.
//  Copyright © 2017 mextech. All rights reserved.
//

import UIKit

private let reuseIdentifier = "posterCell"

class PosterCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return model.featuredPosters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PosterCollectionViewCell
        
        let row = model.featuredPosters[indexPath.row]
            
        cell.imageView.image = UIImage(named: row["image"]!)
        cell.titleLabel.text = row["title"]
        
        return cell
    }

    
    
    
    
    
    
    

}
