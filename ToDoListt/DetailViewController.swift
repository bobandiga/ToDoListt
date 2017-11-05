//
//  DetailViewController.swift
//  ToDoListt
//
//  Created by air on 05.11.17.
//  Copyright © 2017 Maxilimon. All rights reserved.
//

import UIKit

class DetailCardViewController: UIViewController {
    
    var titleOne : String!
    var descr : String!
    var indexF : Int!
    
    var arrayTitle : [String] = []
    var arrayDescr : [String] = []
    
    @IBOutlet weak var bckgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.titleLabel!.text = titleOne
        self.descrLabel!.text = descr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func completeButton(_ sender: Any) {
        
        if var masTitle = UserDefaults.standard.object(forKey: "titleArrayHelp") as? [String]{
            masTitle.remove(at: indexF)
            arrayTitle = masTitle
            
            UserDefaults.standard.set(arrayTitle, forKey: "titleArrayHelp")
        }
        if var masDescr = UserDefaults.standard.object(forKey: "descrArrayHelp") as? [String]{
            masDescr.remove(at: indexF)
            arrayDescr = masDescr
            
            UserDefaults.standard.set(arrayDescr, forKey: "descrArrayHelp")
        }
        
        UserDefaults.standard.synchronize()
        
        UserDefaults.init(suiteName: "group.com.AimDay")?.removeObject(forKey: "counter")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bckgImage.bounds
        self.bckgImage.addSubview(blurEffectView)
    }
    
}
