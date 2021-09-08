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
        detailedNote.layer.cornerRadius = 15
        detailedNote.textContainer.lineFragmentPadding = 15
        detailedNote.text = passedNoteText ?? "Введите текст заметки..."
        
        noteToCreate = (buttonTitle == "Сохранить") ? true : false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
}

extension detailViewController: UITextViewDelegate {
    
    func detailNoteBeginEditing(_ detailNote: UITextView) {
        detailNote.backgroundColor = .white
        detailNote.textColor = .gray
    }
    
    func detailNoteDidEndEditing(_ detailNote: UITextView) {
        detailNote.backgroundColor = .systemGray5
        detailNote.textColor = .black
    }
}
