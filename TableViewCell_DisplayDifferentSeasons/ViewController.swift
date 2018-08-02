//
//  ViewController.swift
//  TableViewCell_DisplayDifferentSeasons
//
//  Created by Pranay Boggarapu on 7/26/18.
//  Copyright © 2018 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var icons =  [Icon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        for iconSet in IconSet.iconSets() {
            for individualIcon in iconSet.icons {
            icons.append(individualIcon)
            }
        }
        
    }




}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "iconCell", for: indexPath)
        
        let icon = icons[indexPath.row]
        
        cell.textLabel?.text = icon.title
        cell.detailTextLabel?.text = icon.subTitle
        if let image = icon.image {
            cell.imageView?.image = image
        }
        
        return cell
    }
    
}

