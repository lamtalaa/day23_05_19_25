//
//  LookUpDataViewController.swift
//  ToDoApp
//
//  Created by Yassine Lamtalaa on 5/19/25.
//

import UIKit

class LookUpDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var notes: [Notes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        readNotes()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LookUpDataTableViewCell
        cell?.lookUpDataLabel.text = note.note
        return cell ?? UITableViewCell()
    }
    
    func readNotes() {
        
        let fetchRequest = Notes.fetchRequest()
        let moc = CoreDataManager.shared.persistentContainer.viewContext

        
        do {
            let notes = try moc.fetch(fetchRequest)
            self.notes = notes
            tableView.reloadData()
//            for note in notes {
//                print("Text: \(note.note ?? "No text")")
//                print("Date: \(note.date ?? Date())")
//                print("ID: \(note.id?.uuidString ?? "No ID")")
//            }
        } catch {
            print("Failed to fetch notes: \(error)")
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
