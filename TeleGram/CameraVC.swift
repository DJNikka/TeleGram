//
//  ViewController.swift
//  TeleGram
//
//  Created by Konstantine Piterman on 7/24/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    override func viewDidAppear(_ animated: Bool) {
        
        guard Auth.auth().currentUser != nil else {
            //load login VC
            return
        }
        
        }
    


}

