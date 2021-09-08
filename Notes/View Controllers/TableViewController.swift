//
//  TableViewController.swift
//  Notes
//
//  Created by Алексей on 17.03.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var createdNoteText: String? = nil
    var createTrigger: Bool = false
    
    @IBAction func createNoteTrigger(_ sender: Any) {
        createTrigger = true
    }
    // MARK: Getting changed or new note
    @IBAction func unwindSegueForMainScreen(segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? detailViewController else { return }
        createdNoteText = sourceVC.detailedNote.text

        if sourceVC.noteToCreate! {
            notesList[sourceVC.editedNoteIndex!] = createdNoteText!
        } else {
            addNote(noteItem: createdNoteText!)
        }
        
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = notesList[indexPath.row] as? String

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeNote(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {}
    }
    // MARK: Passing date to Detail View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedVC = segue.destination as? detailViewController else { return }
        if segue.identifier == "editingNoteSegue" {
            detailedVC.buttonTitle = "Сохранить"
            let index = self.tableView.indexPathForSelectedRow
            let indexNumber = index?.row
            detailedVC.passedNoteText = notesList[indexNumber!] as? String
            detailedVC.editedNoteIndex = indexNumber!
        }
    }
}
