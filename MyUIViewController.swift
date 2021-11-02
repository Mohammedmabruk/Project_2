//
//  MyUIViewController.swift
//  Project_2
//
//  Created by Mohammed Mabruk on 26/03/1443 AH.
//

import UIKit

class MyUIViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var arrN = [String]()
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrN.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = arrN[indexPath.row]
     return cell
    }
    
  
    
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var textName: UITextField!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        tableV.dataSource = self
        tableV.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func butEd(_ sender: Any) {
        tableV.isEditing = !tableV.isEditing
    }
    
    @IBAction func butAdd(_ sender: Any) {
        if let Text = textName.text{
            arrN.append(Text)
            let indx = IndexPath(row: arrN.count - 1 , section: 0)
            tableV.beginUpdates()
            tableV.insertRows(at: [indx], with:.automatic )
            tableV.endUpdates()
        
        }
        
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
      
        arrN.swapAt(sourceIndexPath.row, destinationIndexPath.row)
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
