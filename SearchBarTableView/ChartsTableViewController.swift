//
//  ChartsTableViewController.swift
//  SearchBarTableView
//
//  Created by jesuschvz on 12/14/17.
//  Copyright © 2017 mextech. All rights reserved.
//

import UIKit

class ChartsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.charts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chartsCell", for: indexPath) as! ChartsTableViewCell
        
        let row = model.charts[indexPath.row]
            
        cell.numbersLabel.text = "\(indexPath.row + 1)"
        
        cell.posterImageView.image = UIImage(named: row["image"]!)
        cell.titleLabel.text = row["title"]
        cell.descriptionLabel.text = row["description"]
        cell.ratingsLabel.text = row["rating"]
        

        return cell
    }
    

}
