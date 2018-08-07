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

    @IBOutlet weak var prettyIconsTableView: UITableView!
    
    //    var icons =  [Icon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        IconSets = IconSet.iconSets()
        navigationItem.rightBarButtonItem = editButtonItem
        prettyIconsTableView.allowsSelectionDuringEditing = true
        
    }




}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
       
        if editing {
             prettyIconsTableView.beginUpdates()
            for(index, set) in IconSets.enumerated() {
                let indexPath = NSIndexPath(item: set.icons.count, section: index)
                prettyIconsTableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
            prettyIconsTableView.endUpdates()
            prettyIconsTableView.setEditing(true, animated: true)
        } else {
            prettyIconsTableView.beginUpdates()
            for(index, set) in IconSets.enumerated() {
                let indexPath = NSIndexPath(item: set.icons.count, section: index)
                prettyIconsTableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
            prettyIconsTableView.endUpdates()
            prettyIconsTableView.setEditing(false, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return IconSets.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let adjustment = isEditing ? 1 : 0
        
        
        return IconSets[section].icons.count + adjustment
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "iconCell", for: indexPath)
        let section = IconSets[indexPath.section]
        
    
        if indexPath.row >= section.icons.count && isEditing {
            
            cell.textLabel?.text = "Add Icon"
            cell.detailTextLabel?.text = nil
            cell.imageView?.image = nil
        } else {
            let icon = section.icons[indexPath.row]
            cell.textLabel?.text = icon.title
            cell.detailTextLabel?.text = icon.subTitle
            if let image = icon.image {
                cell.imageView?.image = image
            } else {
                cell.imageView?.image = nil
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return IconSets[section].name
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let set = IconSets[indexPath.section]
            set.icons.remove(at: indexPath.row)
            //tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }else if editingStyle == .insert {
            let newIcon = Icon(withTitle: "New Icon", subtitle: "", imageName: nil)
            let set = IconSets[indexPath.section]
            set.icons.append(newIcon)
            tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let section = IconSets[indexPath.section]
        if indexPath.row >= section.icons.count {
            return .insert
        }
        return .delete
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let set = IconSets[indexPath.section]
        if isEditing && indexPath.row < set.icons.count {
            return nil
        }
        return indexPath
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        prettyIconsTableView.deselectRow(at: indexPath, animated: true)
        let set = IconSets[indexPath.section]
        if indexPath.row >= set.icons.count && isEditing {
            self.tableView(prettyIconsTableView, commit: .insert, forRowAt: indexPath)
        }
    }
    
}

