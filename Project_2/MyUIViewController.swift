//
//  MyUIViewController.swift
//  Project_2
//
//  Created by Mohammed Mabruk on 26/03/1443 AH.
//

import UIKit

class MyUIViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UpdateText {
    var list : List!

    func updateTitle(index: Int, title: String) {
        list.items[index].title = title
        tableV.reloadData()
    }
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = list.items[indexPath.row].title
     return cell
    }
    
  
    
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var textName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let Text1 = UserDefaults.standard.object(forKey: "textName")
//        textName.text = Text1 as? String
        tableV.dataSource = self
        tableV.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func butEd(_ sender: Any) {
        tableV.isEditing = !tableV.isEditing
    }
    
    @IBAction func butAdd(_ sender: Any) {
        if let Text = textName.text{
            list.items.append(Item(title: Text))
            let indx = IndexPath(row: list.items.count - 1 , section: 0)
//            tableV.beginUpdates()
            tableV.insertRows(at: [indx], with:.automatic )
//            tableV.endUpdates()
            textName.text = ""
        }
//        UserDefaults.standard.set(textName.text, forKey: "textName")
    
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
      
        list.items.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            list.items.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editVC = storyboard?.instantiateViewController(withIdentifier: "Edit ID") as! EditViewController
        editVC.noteTitle = list.items[indexPath.row].title
        editVC.indexPath = indexPath.row
        editVC.delegate = self
        navigationController?.pushViewController(editVC, animated: true)
        
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

