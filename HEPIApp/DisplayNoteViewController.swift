//
//  DisplayNoteViewController.swift
//  HEPIApp
//
//  Created by Kevin Bonga on 02.09.21.
//  Copyright © 2021 Kevin Bonga. All rights reserved.
//

import UIKit
import CoreData


class DisplayNoteViewController: UIViewController {

    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 1
        if let note = note {
            // 2
            titleTextField.text = note.title
            contentTextView.text = note.content
        } else {
            // 3
            titleTextField.text = ""
            contentTextView.text = ""
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "save" where note != nil:
            note?.title = titleTextField.text ?? ""
            note?.content = contentTextView.text ?? ""
            note?.creationTime = Date()

            CoreDataHelper.saveNote()

        case "save" where note == nil:
            let note = CoreDataHelper.newNote()
            note.title = titleTextField.text ?? ""
            note.content = contentTextView.text ?? ""
            note.creationTime = Date()

            CoreDataHelper.saveNote()

        case "cancel":
            print("cancel bar button item tapped")

        default:
            print("unexpected segue identifier")
        }
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
