//
//  EnterDataViewController.swift
//  ToDoApp
//
//  Created by Yassine Lamtalaa on 5/19/25.
//

import UIKit

class EnterDataViewController: UIViewController {

    @IBOutlet weak var enterDataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        saveNotes()
        enterDataTextField.text = ""
    }
    
    func saveNotes() {
       
        let moc = CoreDataManager.shared.persistentContainer.viewContext
        
        let note = Notes(context: moc)
        note.id = UUID()
        note.date = Date()
        note.note = enterDataTextField.text
        
        CoreDataManager.shared.saveContext()
    }
}
