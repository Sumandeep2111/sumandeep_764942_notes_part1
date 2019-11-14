//
//  dataTableViewController.swift
//  sumandeep_764942_notes_part1
//
//  Created by Simran Chakkal on 2019-11-10.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//github link
//https://github.com/Sumandeep2111/Sumandeep_c0764942_Note_p1.git

import UIKit

class dataTableViewController: UITableViewController {
  var image : UIImage?
    var textfield2 : UITextField?
  
    var curFolderIndex = -1
    
   
   
    
   
    
    @IBOutlet var tableviewdata: UITableView!
    
   
    @IBAction func newFolder(_ sender: UIBarButtonItem) {
    
    
    var alreadyExists = false
    
    
    let alertcontrol = UIAlertController(title: "New Folder", message: "Enter the name of folder", preferredStyle: .alert)
        alertcontrol.addTextField { (textfield) in
            textfield.text = ""
            //same name alert
      
            //self.textfield = textfield
        }
            let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            
        let addaction = UIAlertAction(title: "Add item", style: .default) {(action) in
            let textfield1 = alertcontrol.textFields![0]
            
            let folderName = textfield1.text!
            let folderNotes = FoldersStruct(folder: folderName, notes: [])
            
            
            for items in FoldersStruct.foldersData{
                if items.folder == folderName{
                    alreadyExists = true
                    break
                }
            }
            
            
            if alreadyExists {
                  let alertcontrollernametaken = UIAlertController(title: "Name Taken", message: "Please choose a different name", preferredStyle: .alert)
                  let nametaken = UIAlertAction(title:"OK",style: .cancel,handler: nil)
                  alertcontrollernametaken.addAction(nametaken)
                  self.present(alertcontrollernametaken, animated: true, completion: nil)

                  }
            else{
                FoldersStruct.foldersData.append(folderNotes)
//                UserDefaults.standard.set(textfield1.text, forKey: "myfolder")
                
            }
           
            
            print(FoldersStruct.foldersData)
            self.tableviewdata.reloadData()
                
            }
        alertcontrol.addAction(okAction)
        alertcontrol.addAction(addaction)
                
             self.present(alertcontrol, animated: true, completion: nil)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.navigationItem.rightBarButtonItem = editButtonItem
        //self.navigationItem.title = "Folders"
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .lightGray
        
//    array = []
    // Do any additional setup afterloading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myfolder") as? String{
            textfield2?.text = x
            print(x)
        }
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       return 1
        
    }
 */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FoldersStruct.foldersData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "normalcell"){
      
            let arrayname = FoldersStruct.foldersData[indexPath.row].folder
       
        cell.textLabel?.text = arrayname
            
        cell.imageView?.image = UIImage(named: "folder-icon")
            cell.detailTextLabel?.text = "\(FoldersStruct.foldersData[indexPath.row].notes.count)"
        // Configure the cell...
           // cell.detailTextLabel?.textColor = UIColor.white
            
        return cell
    }
       return UITableViewCell()
        
        
    }
   // func alert(

   
// Override to support conditional editing of the table view.
    //for delete rows in cells
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
            return "delete"
        }
    //    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //        return UITableViewCellEditingStyleDelete
    //    }
    // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
               // let item = array![indexPath.row]
                FoldersStruct.foldersData.remove(at: indexPath.row)

                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.reloadData()
            }
        }
    //
    //
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //
    //    }
    //
    //
    //    @IBAction func editbutton(_ sender: UIBarButtonItem) {
    //
    //
    //
    //    }
    //
    //    // Override to support rearranging the table view.
    //    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    //
    //       let item = array![]
    //        array?.remove(at: IndexPath.row)
    //
    //
    //
    //
    //
    //    }
        
       override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if self.tableView.isEditing{
           return .none
        }
        else{
            return .delete
        }
       }
        override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
           return false
        }
        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let moveobjects = FoldersStruct.foldersData[sourceIndexPath.row]
            FoldersStruct.foldersData.remove(at: sourceIndexPath.row)
            FoldersStruct.foldersData.insert(moveobjects, at: destinationIndexPath.row)
             debugPrint("\(sourceIndexPath.row) => \(destinationIndexPath.row)")
            
        }
    //
    //
    //    // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    //        // Return false if you do not want the item to be re-orderable.
    return true
        }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let detailview = segue.destination as? dataTableViewController{
        detailview.delegateFolder = self
        if let tableviewcell = sender as?UITableViewCell{
            if let index = tableView.indexPath(for: tableviewcell)?.row{
        curFolderIndex = index
                print(detailview.curFolderIndex)
    }
        }
    }
    

    
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
    

}
