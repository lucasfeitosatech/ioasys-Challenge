//
//  MasterViewController.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 22/10/20.
//

import UIKit

class MasterViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let loader = Loader()
    @IBOutlet weak var searchTextField: UITextField!
    var activeTextField : UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        searchTextField.addTarget(self, action: #selector(self.onSearchChange(_:)), for: .editingChanged)
        searchTextField.returnKeyType = .done
        searchTextField.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @objc func onSearchChange(_ textField: UITextField) {
        
        guard let searchText  = textField.text else {return}
        getEnterprises(filter: searchText)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func getEnterprises(filter:String) {

        
        if loader.isShowing {
            return
        }
        loader.show(controller: self)
        
        APIManager.shared().getEnterprisesWithFilter(filter: filter, id:"1") { success in
            self.loader.dismiss()
            if success {
                
            }
        
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

extension MasterViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell else {return UITableViewCell()}
        
        return cell
        
    }
    
    
    


}
