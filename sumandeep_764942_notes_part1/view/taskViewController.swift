//
//  taskViewController.swift
//  sumandeep_764942_notes_part1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class taskViewController: UIViewController {
    
    @IBOutlet weak var taskView: UITextView!
    var textString: String?
    var taskTable:notesTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskView.text = textString ?? ""
    }
    override func viewWillDisappear(_ animated: Bool) {
        taskTable?.updateText(text:taskView.text)
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
