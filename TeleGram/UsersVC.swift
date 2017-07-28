//
//  UsersVC.swift
//  TeleGram
//
//  Created by Konstantine Piterman on 7/27/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import UIKit

class UsersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        tableView.allowsMultipleSelection = true
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    

    @nonobjc
    func tableView(_ tableView: UITableView, didDeelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ talbeView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    

}
