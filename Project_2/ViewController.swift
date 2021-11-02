//
//  ViewController.swift
//  Project_2
//
//  Created by Mohammed Mabruk on 26/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    var list = List()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func goToTableButton(_ sender: Any) {
        performSegue(withIdentifier: "goToTableSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableVC = segue.destination as! MyUIViewController
        tableVC.list = list
        
    }
}

