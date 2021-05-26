//
//  detailViewController.swift
//  Notes
//
//  Created by Алексей on 26.05.2021.
//

import UIKit

class detailViewController: UIViewController {
    
    var passedNoteText: String?
    var buttonTitle: String? = "Создать"
    var editedNoteIndex: Int?
    var noteToCreate: Bool? = true
    
    @IBOutlet weak var detailedNote: UITextView!
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton.setTitle(buttonTitle, for: .normal)
        detailedNote.textContainer.lineFragmentPadding = 10
        detailedNote.text = passedNoteText ?? "Введите текст заметки..."
        
        noteToCreate = (buttonTitle == "Сохранить") ? true : false
    }
}
