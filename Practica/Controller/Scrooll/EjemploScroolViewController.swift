//
//  EjemploScroolViewController.swift
//  Practica
//
//  Created by Daruchi on 7/8/20.
//  Copyright © 2020 Daruchi. All rights reserved.
//

import UIKit

class EjemploScroolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 32/255, green: 149/255, blue: 215/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        // Do any additional setup after loading the view.
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
