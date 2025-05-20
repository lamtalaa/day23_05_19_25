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

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
