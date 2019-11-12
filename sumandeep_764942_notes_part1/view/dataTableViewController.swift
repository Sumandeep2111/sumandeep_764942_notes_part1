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
    var folder : [String]?
    var folders:UITextField!
   
    
    @IBOutlet var tabledata: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "Folders"
        folder = []
    }
     // Create new folder
   // @IBAction func new_folder(_ sender: UIBarButtonItem) {
    
    @IBAction func newfolder(_ sender: UIBarButtonItem) {
    addnewfolder()
    }
    // function to create an alert
    func addnewfolder() {
        let alertctrl = UIAlertController(title: "New Folder", message: "Enter the name of folder", preferredStyle: .alert)
        alertctrl.addTextField { (textField) in
            textField.text = ""
        }
         let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "AddItem", style: .default) { (action) in
            let txt = alertctrl.textFields![0]
            if self.folder!.contains(txt.text!){
                let alert = UIAlertController(title: "Name Taken", message: "Please choose a different name ", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                alert.addAction(okAction)
                self.present(alert,animated: true,completion: nil)
            }
            else {
            self.folder!.append(txt.text!)
            print(self.folder!)
            self.tabledata.reloadData()
            }
        }
        alertctrl.addAction(okAction)
        alertctrl.addAction(add)
        self.present(alertctrl, animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folder?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellidentifier"){
            let foldername = folder![indexPath.row]
                cell.textLabel?.text = foldername
                   cell.imageView?.image = UIImage(named: "folder-icon")
                          return cell
        }
        // Configure the cell...

        return UITableViewCell()
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
         return "delete"
     }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                 folder?.remove(at: indexPath.row)
              // Delete the row from the data source
                   tableView.deleteRows(at: [indexPath], with: .automatic)
                   tableView.reloadData()
               }
         
    }
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
         let move = self.folder![sourceIndexPath.row]
        folder?.remove(at: sourceIndexPath.row)
         folder?.insert(move, at: destinationIndexPath.row)
          debugPrint("\(sourceIndexPath.row) => \(destinationIndexPath.row)")
         
     }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
