//
//  TableViewController.swift
//  Notes
//
//  Created by Алексей on 17.03.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var selectedNoteText:UITextField?
    
    @IBAction func pushAddNote(_ sender: Any) {
        let noteController = UIAlertController(title: "Создание заметки", message: nil, preferredStyle: .alert)
        let noteActionCancel = UIAlertAction(title: "Закрыть", style: .destructive) { (alert) in }
        let noteActionCreate = UIAlertAction(title: "Создать", style: .default) { (alert) in
            let newNoteItem = noteController.textFields![0].text
            if newNoteItem != "" {
                addNote(noteItem: newNoteItem!)
                self.tableView.reloadData()
            }
        }
        
        noteController.addTextField { (textField) in
            textField.placeholder = "Введите текст заметки..."
            noteActionCreate.isEnabled = false
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main, using: {_ in
                let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                let textIsNotEmpty = textCount > 0
                
                noteActionCreate.isEnabled = textIsNotEmpty
            })
        }
    
        noteController.addAction(noteActionCancel)
        noteController.addAction(noteActionCreate)
        present(noteController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = notesList[indexPath.row] as? String

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteSelectedText = notesList[indexPath.row] as? String
        let editDialog = UIAlertController(title: "Изменить заметку", message: nil, preferredStyle: .alert)
        let noteEditCancel = UIAlertAction(title: "Закрыть", style: .destructive) { (alert) in }
        let noteEditUpdate = UIAlertAction(title: "Сохранить", style: .default) { (alert) in
            let updatedNoteText = editDialog.textFields![0].text
            notesList[indexPath.row] = updatedNoteText
            self.tableView.reloadData()
        }
        editDialog.addTextField { (textField) in
            textField.text = noteSelectedText
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main, using: {_ in
                let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                let textIsNotEmpty = textCount > 0
                
                noteEditUpdate.isEnabled = textIsNotEmpty
            })
        }
    
        editDialog.addAction(noteEditCancel)
        editDialog.addAction(noteEditUpdate)
        present(editDialog, animated: true, completion: nil)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeNote(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}
