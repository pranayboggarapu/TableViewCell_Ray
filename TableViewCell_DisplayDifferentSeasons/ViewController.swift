//
//  ViewController.swift
//  TableViewCell_DisplayDifferentSeasons
//
//  Created by Pranay Boggarapu on 7/26/18.
//  Copyright © 2018 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var IconSets  = [IconSet]()

//    var icons =  [Icon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        IconSets = IconSet.iconSets()
        
        
    }




}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return IconSets.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IconSets[section].icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "iconCell", for: indexPath)
        
        let icon = IconSets[indexPath.section].icons[indexPath.row]
    
        
        cell.textLabel?.text = icon.title
        cell.detailTextLabel?.text = icon.subTitle
        if let image = icon.image {
            cell.imageView?.image = image
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return IconSets[section].name
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    
}

