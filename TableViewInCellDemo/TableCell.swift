//
//  TableCell.swift
//  TableViewInCellDemo
//
//  Created by Itsuki on 2024/02/23.
//

import UIKit

class TableCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    static let cellIdentifier = String(describing: TableCell.self)

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var items: Array<String> = [] {
        didSet {
            tableView.reloadData()
            tableViewHeightConstraint.constant = tableView.contentSize.height
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.rowHeight = 40
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellInTableCell")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.layer.borderColor = UIColor.systemGray5.cgColor
        tableView.layer.borderWidth = 1.0
        tableView.layer.cornerRadius = 4.0
        tableView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellInTableCell", for: indexPath)
        let title = items[indexPath.row]
        
        if #available(iOS 14.0, *) {
            var config = cell.defaultContentConfiguration()
            config.text = "\(title)"
            config.textProperties.font = UIFont.systemFont(ofSize: 14)
            cell.contentConfiguration = config
        } else {
            cell.textLabel?.text = "\(title)"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        
        return cell
    }
}
