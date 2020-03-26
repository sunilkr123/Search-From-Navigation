//
//  ViewController.swift
//  SearchDemo
//
//  Created by baps on 24/03/20.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbutton: UIBarButtonItem!
    
    var dataList = [Model]()
    var filterData = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.text  = "Storage Yard's"
        searchTextField.isUserInteractionEnabled = false
        searchTextField.textColor = UIColor.white
        searchbutton.image = UIImage(systemName: "magnifyingglass")
        storeData()
        
    }
    
    var toggle = false
    @IBAction func searchButtonAction(_ sender: UIBarButtonItem) {
        if toggle == false{
            searchTextField.isUserInteractionEnabled = true
            searchTextField.text  = ""
            searchTextField.becomeFirstResponder()
            searchTextField.textColor = UIColor.white
            searchbutton.image = UIImage(systemName: "multiply")
            toggle = true
            
        }else{
            searchTextField.resignFirstResponder()
            searchbutton.image = UIImage(systemName: "magnifyingglass")
            searchTextField.text  = "Storage Yard's"
            searchTextField.isUserInteractionEnabled = false
            searchTextField.textColor = UIColor.white
            filterData = dataList
            self.tableView.reloadData()
            toggle = false
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func searchTextField(_ sender: UITextField) {
        print("test")
        if dataList.count > 0 {
            filterData(sender.text!)
        }
        if searchTextField.text == "" {
            filterData = dataList
        }
        tableView.reloadData()
    }
    
    // short data
    func filterData(_ text: String) {
        if text.count > 0 {
            self.filterData = self.dataList.filter({ (Model) -> Bool in
                ((Model.name?.uppercased().contains(text.uppercased()))!)
            })
        }
    }
}

@available(iOS 13.0, *)
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = self.filterData[indexPath.row]
        if filterData.indices.contains(indexPath.row) {
            cell.textLabel?.text = filterData[indexPath.row].name
            cell.detailTextLabel?.text = filterData[indexPath.row].address
            
        }
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func storeData()  {
        let obj1 = Model(name: "Sunil", address: "Mumbai")
        self.filterData.append(obj1)
        let obj2 = Model(name: "Vikas", address: "Mumbai")
        self.filterData.append(obj2)
        let obj3 = Model(name: "Sanajy", address: "Mumbai")
        self.filterData.append(obj3)
        let obj4 = Model(name: "Surya", address: "Mumbai")
        self.filterData.append(obj4)
        let obj5 = Model(name: "Vijay", address: "Mumbai")
        self.filterData.append(obj5)
        let obj6 = Model(name: "Akshay", address: "Mumbai")
        self.filterData.append(obj6)
        let obj7 = Model(name: "Manish", address: "Mumbai")
        self.filterData.append(obj7)
        let obj8 = Model(name: "Priya", address: "Mumbai")
        self.filterData.append(obj8)
        let obj9 = Model(name: "Pooja", address: "Mumbai")
        self.filterData.append(obj9)
        let obj10 = Model(name: "Jyoti", address: "Mumbai")
        self.filterData.append(obj10)
        dataList = filterData
    }
    
}
