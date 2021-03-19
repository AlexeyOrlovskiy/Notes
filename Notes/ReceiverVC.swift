//
//  ReceiverVC.swift
//  Notes
//
//  Created by Алексей on 19.03.2021.
//

import UIKit

class ReceiverVC: UITableViewController {
    
    var text: String?

    @IBOutlet var textField: UITextView!
    
    override func viewDidLoad() {
        if let receiverText = text {
            textField.text = receiverText
        }
    }
}
