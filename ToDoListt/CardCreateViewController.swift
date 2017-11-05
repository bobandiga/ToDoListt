//
//  CardCreateViewController.swift
//  ToDoListt
//
//  Created by air on 05.11.17.
//  Copyright © 2017 Maxilimon. All rights reserved.
//

import UIKit

class CardCreateViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descrTextField: UITextField!
    
    var titleArrayHelp : [String] = []
    var descrArrayHelp : [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        if let masTitle = UserDefaults.standard.object(forKey: "titleArrayHelp") as? [String]{
            titleArrayHelp = masTitle
            //print("Show Title count : ",titleArrayHelp.count)
        }
        
        if let masDescr = UserDefaults.standard.object(forKey: "descrArrayHelp") as? [String]{
            descrArrayHelp = masDescr
            //print("Show Descr count : ",descrArrayHelp.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextField?.delegate = self
        self.descrTextField?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        descrTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addDataToCell(_ sender: Any) {
        saveData()
    }
    
    //Add data to UserDefaults
    func saveData(){
        
        if descrTextField.text! == "" || titleTextField.text! == ""{
            let alertController = UIAlertController(title: "Error", message: "Fill everythings fields", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                if self.descrTextField.text! == ""{
                    self.descrTextField.becomeFirstResponder()
                }
                if self.titleTextField.text! == ""{
                    self.titleTextField.becomeFirstResponder()
                }
            })
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }else{
            self.descrArrayHelp.append(self.descrTextField.text!)
            UserDefaults.standard.set(self.descrArrayHelp, forKey: "descrArrayHelp")
            self.titleArrayHelp.append(self.titleTextField.text!)
            UserDefaults.standard.set(self.titleArrayHelp, forKey: "titleArrayHelp")
            UserDefaults.standard.synchronize()
            
            UserDefaults.init(suiteName: "group.com.AimDay")?.set(self.titleArrayHelp.count, forKey: "counter")
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
