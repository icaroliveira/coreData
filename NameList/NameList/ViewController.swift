//
//  ViewController.swift
//  NameList
//
//  Created by icaro on 23/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista de Nomes"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Nome", message: "Insira o novo nome", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default){
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
            let nameToSave = textField.text else {
                return
            }
            self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = names [indexPath.row]
        return cell
    }
}
