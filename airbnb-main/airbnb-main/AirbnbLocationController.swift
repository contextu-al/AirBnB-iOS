//
//  AirbnbLocationController.swift
//  airbnb-main
//
//  Created by admin on 2022/12/8.
//  Copyright © 2022 Contextual.
//

import Foundation
import UIKit
import ContextualSDK

protocol AirbnbLocationControllerDelegate: class {
    func locationController(_ locationController: AirbnbLocationController, didSaveCity city: LocationItem?)
}

class AirbnbLocationController: ContextualBaseViewController {
    
    let manager = LocationDataManager()
    var selectedCity: LocationItem?
    let cellID = "cellID"
    
    weak var delegate: AirbnbLocationControllerDelegate?
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        view.register(LocationCell.self, forCellReuseIdentifier: self.cellID)
        view.rowHeight = 40
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var dismissButton: UIBarButtonItem = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "Back", in: Bundle(for: AirbnbLocationController.self), compatibleWith: nil), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(AirbnbLocationController.handleDismiss), for: .touchUpInside)
        let barBtn = UIBarButtonItem(customView: btn)
        return barBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select a location"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setupTableView()
        view.backgroundColor = Theme.PRIMARY_COLOR
        setupNavigationBar()
        manager.fetch()
    }
    
    private func setupTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = Theme.PRIMARY_COLOR
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo:  view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true        
        view?.backgroundColor = .green
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        self.navigationItem.setLeftBarButton(dismissButton, animated: true)
    }
    
    @objc func handleDismiss() {
        self.delegate?.locationController(self, didSaveCity: self.selectedCity)
        self.navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    private func setcheckMark(for cell: UITableViewCell, location: LocationItem){
        if selectedCity == location {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
}

extension AirbnbLocationController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfLocationItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LocationCell
        let location = manager.locationItem(at: indexPath.row)
        cell.textLabel?.text = location.cityAndState
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.tintColor = .white
        cell.selectionStyle = .none
        setcheckMark(for: cell, location: location)
        return cell
    }
}

extension AirbnbLocationController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
            selectedCity = manager.locationItem(at: indexPath.row)
            tableView.reloadData()
        }
    }
}


