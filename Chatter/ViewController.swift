//
//  ViewController.swift
//  Chatter
//
//  Created by Tanmay Bakshi on 2016-09-17.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {
    
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    let wormhole = MMWormhole(applicationGroupIdentifier: "group.com.TBSS.sirikitexample", optionalDirectory: "sirikitexample")
    
    var to = ""
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        INPreferences.requestSiriAuthorization { (a) in
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        wormhole.listenForMessage(withIdentifier: "tomsg") { (res) in
            if let message = res {
                self.to = message as! String
            }
        }
        wormhole.listenForMessage(withIdentifier: "contentmsg") { (res) in
            if let message = res {
                self.content = message as! String
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        toLabel.text = to
        contentLabel.text = content
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
