# Search-From-Navigation
Steps to implement
##1.Add the Navigation Cotroller to the ViewController,and drag the UItextField and make the outlets of that and add the following code to the ViewDidLoad()

#Outlets of textField

 @IBOutlet weak var searchTextField: UITextField!
 
 

   
       
        searchTextField.text  = "Stident's Name"
        searchTextField.isUserInteractionEnabled = false
        searchTextField.textColor = UIColor.white
        searchbutton.image = UIImage(systemName: "magnifyingglass")
        storeData()
        
        

    
    
##2.Make the action of the textfield with the type of didEditing changed
 
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
    
    ###Download the code and use it 
    
   # ##Preview of the Screen
  
  
<img src="https://github.com/sunilkr123/Search-From-Navigation/blob/master/SearchDemo/Attachment/search2.gif" width="300" height="600">
