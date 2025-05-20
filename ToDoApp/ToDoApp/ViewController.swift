//
//  ViewController.swift
//  ToDoApp
//
//  Created by Yassine Lamtalaa on 5/19/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func enterDataButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "EnterDataViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func lookUpDataTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LookUpDataViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

