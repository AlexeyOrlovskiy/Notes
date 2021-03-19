//
//  ViewController.swift
//  Notes
//
//  Created by Алексей on 17.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var notesArray: [String]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray?.count ?? <#default value#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: <#T##IndexPath#>)
        note.textLabel?.text = notesArray?[indexPath.row]
        return note
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
    }
    
    @IBOutlet weak var notesTable: UITableView!
    
    @IBAction func createNote(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

