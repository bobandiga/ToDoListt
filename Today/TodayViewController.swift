//
//  TodayViewController.swift
//  Today
//
//  Created by air on 05.11.17.
//  Copyright © 2017 Maxilimon. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var pushLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushLabel.text = "Add new note"
        
        if let countFromApp = UserDefaults.init(suiteName: "group.com.AimDay")?.value(forKey: "counter") {
            pushLabel.text = "\(countFromApp) notes are waiting for u"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        if let countFromApp = UserDefaults.init(suiteName: "group.com.AimDay")?.value(forKey: "counter") {
            if pushLabel.text != countFromApp as? String {
                pushLabel.text = "\(countFromApp) notes are waiting for u"
                completionHandler(NCUpdateResult.newData)
            } else {
                completionHandler(NCUpdateResult.noData)
            }
        } else {
            pushLabel.text = "Add new note"
            completionHandler(NCUpdateResult.newData)
        }
    }
    
}
