//
//  ViewController.swift
//  ToDoListt
//
//  Created by air on 05.11.17.
//  Copyright © 2017 Maxilimon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var collectionVC: UICollectionView!
    
    var arrayTitle : [String] = []
    var arrayDescr : [String] = []
    let colors = [UIColor(red: 32/256, green: 178/256, blue: 170/256, alpha: 0.8),
                  UIColor(red: 65/256, green: 105/256, blue: 225/256, alpha: 0.8),
                  UIColor(red: 123/256, green: 104/256, blue: 238/256, alpha: 0.8),
                  UIColor(red: 255/256, green: 160/256, blue: 122/256, alpha: 0.8),
                  UIColor(red: 210/256, green: 105/256, blue: 30/256, alpha: 0.8),
                  UIColor(red: 32/256, green: 178/256, blue: 170/256, alpha: 0.8),
                  UIColor(red: 65/256, green: 105/256, blue: 225/256, alpha: 0.8),
                  UIColor(red: 123/256, green: 104/256, blue: 238/256, alpha: 0.8),
                  UIColor(red: 255/256, green: 160/256, blue: 122/256, alpha: 0.8),
                  UIColor(red: 210/256, green: 105/256, blue: 30/256, alpha: 0.8)
    ]
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        
        
        UserDefaults.standard.synchronize()
        if let masTitle = UserDefaults.standard.object(forKey: "titleArrayHelp") as? [String]{
            arrayTitle = masTitle
        }
        if let masDescr = UserDefaults.standard.object(forKey: "descrArrayHelp") as? [String]{
            arrayDescr = masDescr
        }
        DispatchQueue.main.async {
            self.collectionVC.reloadData()
        }
        print(arrayTitle)
        print(arrayDescr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bckgImage = UIImageView(image: UIImage(named: "bckgDetail"))
        bckgImage.frame = collectionVC.bounds
        bckgImage.contentMode = .scaleToFill
        
        collectionVC.backgroundView = bckgImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        cell.bckgView.backgroundColor = colors[Int(drand48()*10)]
        cell.titleLabel.text = arrayTitle[indexPath.item]
        cell.descrLabel.text = arrayDescr[indexPath.item]
        
        return cell
    }
    
    @IBAction func deleteObjects(_ sender : Any){
        
        UserDefaults.standard.removeObject(forKey: "titleArrayHelp")
        UserDefaults.standard.removeObject(forKey: "descrArrayHelp")
        UserDefaults.standard.synchronize()
        
        arrayTitle = []
        arrayDescr = []
        
        DispatchQueue.main.async {
            self.collectionVC.reloadData()
        }
        UserDefaults.init(suiteName: "group.com.AimDay")?.removeObject(forKey: "counter")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail"{
            let cell = sender as! CardCollectionViewCell
            let indexPath = self.collectionVC.indexPath(for: cell)
            
            let dvc = segue.destination as! DetailCardViewController
            dvc.titleOne = arrayTitle[(indexPath?.item)!]
            dvc.descr = arrayDescr[(indexPath?.item)!]
            dvc.indexF = indexPath?.item
            
            print("Done")
        }
    }
}

