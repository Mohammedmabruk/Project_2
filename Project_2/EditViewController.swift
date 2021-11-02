//
//  EditViewController.swift
//  Project_2
//
//  Created by Mohammed Mabruk on 27/03/1443 AH.
//

import UIKit
protocol UpdateText {
    func updateTitle(index: Int, title: String)
}

class EditViewController: UIViewController {
    
    var delegate : UpdateText!
    var noteTitle = ""
    var indexPath = 0
    
    @IBOutlet weak var noText: UITextField!
    @IBOutlet weak var labV: UILabel!
    
    @IBAction func btnSave(_ sender: Any) {
        delegate.updateTitle(index: indexPath, title: noText.text!)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        noText.text = noteTitle
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
