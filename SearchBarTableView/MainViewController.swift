//
//  MainViewController.swift
//  SearchBarTableView
//
//  Created by jesuschvz on 12/14/17.
//  Copyright © 2017 mextech. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - VIEW DID LOAD
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        chartsView.isHidden = true
        blurView.isHidden = true
        searchCollectionView.isHidden = true
        
        segmentedControl.addTarget(self, action: #selector(tapSegmentedControl(_:)), for: .valueChanged)
        
        segmentedControl.selectedSegmentIndex = 0
        exploreButton = UIBarButtonItem(title: "Explore", style: .plain, target: nil, action: nil)
        searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(loadSearchBar))
        
        navigationItem.titleView = segmentedControl
        navigationItem.leftBarButtonItem = exploreButton
        navigationItem.rightBarButtonItem = searchButton
    }
    
    // MARK: - Navigation Items
    
    let segmentedControl = UISegmentedControl(items: ["Featured", "Charts"])
    var exploreButton: UIBarButtonItem?
    var searchButton: UIBarButtonItem?
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var featuredView: UIView!
    @IBOutlet weak var chartsView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    // MARK: - INTERACTIONS
    
    @objc func tapSegmentedControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            featuredView.isHidden = false
            chartsView.isHidden = true
            
        } else {
            
            featuredView.isHidden = true
            chartsView.isHidden = false
            
        }
        
    }
    
    
    @IBAction func tapBlurView(_ sender: UIButton) {
        
        dismissSearch()
        
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchResults = [AnyObject]()
    
    //Mark: UISearchResultsUpdating Protocol
    @objc func loadSearchBar() {
        
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = false
        searchController.dimsBackgroundDuringPresentation = false
        
        navigationItem.titleView = searchController.searchBar
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.keyboardAppearance = .dark
        searchController.searchBar.becomeFirstResponder()
        
        let searchfield = searchController.searchBar.value(forKey: "searchField") as! UITextField
        
        searchfield.backgroundColor = UIColor(hue: 0.4, saturation: 0, brightness: 0.212, alpha: 1)
        
        searchfield.textColor = .white
        
        searchController.searchBar.delegate = self
        
        blurView.isHidden = false
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        //get Data as NSArray
        //filter Data
        //return search results
        
        let predicate = NSPredicate(format: "description contains[cd] %@", searchController.searchBar.text!)
        
        let filteredResults = (model.featuredPosters as NSArray).filtered(using: predicate)
        
        
        searchResults = filteredResults as [AnyObject]
        searchCollectionView.reloadData()
        
        //******* tableView.reloadData()
        
        //print(filteredResults)
        //print("Number of Results: \(filteredResults.count)")
        
    }
    
    // MARK: - UISearchBarDelegate Protocol
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        dismissSearch()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     
        if searchText.characters.count == 0 {
            searchCollectionView.isHidden = true
        } else {
            searchCollectionView.isHidden = false
        }
    }
    
    // MARK: Search Functions
    
    func dismissSearch() {
        
        navigationItem.titleView = nil
        navigationItem.titleView = segmentedControl
        navigationItem.leftBarButtonItem = exploreButton
        navigationItem.rightBarButtonItem = searchButton
        blurView.isHidden = true
        searchCollectionView.isHidden = true
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchResults.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! PosterCollectionViewCell
        
        let row = searchResults[indexPath.row]
        
        cell.imageView.image = UIImage(named: row["image"] as! String)
        cell.titleLabel.text = row["title"] as? String
        
        return cell
    }
    

}
