//
//  ViewController.swift
//  TableViewInCellDemo
//
//  Created by Itsuki on 2024/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    
    var sectionOneItems = ["item 1 in section 1", "item 2 in section 1", "item 3 in section 1", ]
    var sectionThreeItems = ["item 1 in section 3", "item 2 in section 3", "item 3 in section 3", ]

    var tableItems = ["item 1 in table cell", "item 2 in table cell", "item 3 in table cell"]
    
    var dataSource: Array<Array<String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [sectionOneItems, tableItems, sectionThreeItems]
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: TableCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: TableCell.cellIdentifier)
        mainTableView.register(UINib(nibName: RegularCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: RegularCell.cellIdentifier)
        
        mainTableView.estimatedRowHeight = 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        } else {
            return dataSource[section].count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: TableCell.cellIdentifier, for: indexPath) as! TableCell
            cell.items = dataSource[indexPath.section]
            return cell

        } else {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: RegularCell.cellIdentifier, for: indexPath) as! RegularCell
            cell.label.text = dataSource[indexPath.section][indexPath.row]
            return cell
        }
    }

}
