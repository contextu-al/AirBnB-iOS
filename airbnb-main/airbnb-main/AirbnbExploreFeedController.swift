//
//  AirbnbExploreFeedController.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/3/12.
//  Copyright © 2017 Contextual.
//

import UIKit

struct AirbnbCategoryModel {
    let name: String
    let cellID: String
    let rowHeight: Double
    let imageUrl: String?
    
    init(name: String, cellID: String, rowHeight: Double, imageUrl: String? = nil) {
        self.name = name
        self.cellID = cellID
        self.rowHeight = rowHeight
        self.imageUrl = imageUrl
    }
}

class AirbnbExploreFeedController: BaseTableController {
    
    let cellID = "cellID"
    let customCellID = "customCellID"
    
    var categories: [AirbnbCategoryModel] = [
        AirbnbCategoryModel(name: "Just Booked", cellID: "cellID", rowHeight: 300),
        AirbnbCategoryModel(name: "Homes", cellID: "cellID", rowHeight: 300),
        AirbnbCategoryModel(name: "Experiences", cellID: "cellID", rowHeight: 300),
        AirbnbCategoryModel(name: "Featured Destinations", cellID: "cellID", rowHeight: 300),
    ]
    
    let locations = ["Milan", "London", "Stavanger", "Munich"]
    
    lazy var homes: [AirbnbHome] = {
        var arr = [AirbnbHome]()
        for i in 0..<4 {
            let location = self.locations[Int(arc4random_uniform(UInt32(self.locations.count)))]
            let home = AirbnbHome(imageName: "home-" + "\(i + 1)", description: "Entire home in \(location)", price: Int(arc4random_uniform(100) + 200), reviewCount: Int(arc4random_uniform(300) + 1), rating: Double(arc4random()) / Double(UINT32_MAX) + 4)
            arr.append(home)
        }
        return arr
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        view.register(AirbnbCategoryTableCell.self, forCellReuseIdentifier: self.cellID)
        view.register(AirbnbCustomTableCell.self, forCellReuseIdentifier: self.customCellID)
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.allowsSelection = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
         setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func addCategory(_ category: AirbnbCategoryModel, atIndex position: Int) {
        let existingCategory = self.categories.filter({ savedCategory in return savedCategory.imageUrl == category.imageUrl }).first
        
        if existingCategory == nil {
            var actualPosition = position
            
            if position < 0 {
                actualPosition = 0
            } else if position > self.categories.count {
                actualPosition = self.categories.count
            }
            
            self.categories.insert(category, at: actualPosition)
            self.insertTableViewSection(actualPosition)
        }
    }
    
    private func insertTableViewSection(_ section: Int) {
        self.tableView.beginUpdates()
        let updatedIndexSet = IndexSet(integer: section)
        self.tableView.insertSections(updatedIndexSet, with: .automatic)
        self.tableView.endUpdates()
    }
}

extension AirbnbExploreFeedController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let category = self.categories[indexPath.section]
        
        return CGFloat(category.rowHeight)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = self.categories[indexPath.section]
        
        switch category.cellID {
        case self.cellID:
            return self.getCellForNormalLayout(category: category, indexPath: indexPath)
        case self.customCellID:
            return self.getCellForCustomLayout(category: category, indexPath: indexPath)
        default:
            return self.getCellForNormalLayout(category: category, indexPath: indexPath)
        }
    }
    
    private func getCellForNormalLayout(category: AirbnbCategoryModel, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: category.cellID, for: indexPath) as! AirbnbCategoryTableCell
        
        cell.title = category.name
        cell.items = homes
        cell.indexPath = indexPath // needed for dismiss animation
        
        if let parent = parent as? AirbnbCategoryTableCellDelegate {
            cell.delegate = parent
        }

        return cell
    }
    
    private func getCellForCustomLayout(category: AirbnbCategoryModel, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: category.cellID, for: indexPath) as! AirbnbCustomTableCell
        
        cell.category = category
        
        return cell
    }
}
