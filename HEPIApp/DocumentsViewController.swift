//
//  DocumentsViewController.swift
//  HEPIApp
//
//  Created by Kevin Bonga on 24.08.21.
//  Copyright © 2021 Kevin Bonga. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController {


    @IBOutlet weak var carteBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        carteBtn.layer.cornerRadius = 17.0
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
