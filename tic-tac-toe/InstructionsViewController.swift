//
//  InstructionsViewController.swift
//  tic-tac-toe
//
//  Created by Fabián Rodríguez Gámez on 22/2/18.
//  Copyright © 2018 Fabián Rodríguez Gámez. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
