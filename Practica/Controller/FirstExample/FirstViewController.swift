//
//  FirstViewController.swift
//  Practica
//
//  Created by Daruchi on 6/4/20.
//  Copyright © 2020 Daruchi. All rights reserved.
//

import UIKit

protocol FirstViewControllerProtocol: class {
    func getText(string: String?) -> String
}

class FirstViewController: UIViewController {
    //IBOutles all the widgests
    //values and constans
    //instances of classes

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.setupDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.setupWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.setupDidDisappear()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
//        if (BundleIdProject.fnMvp4App()) {
//            return .lightContent
//        } else {
//            return .default
//        }
    }
    
    //here other methods with override for this class of ViewController
}

//Estas extensiones en archivos separados para que se vea mejor
extension FirstViewController {
    fileprivate func setupDidLoad() {
        //here all functions in this lifecycles of VC
        self.validateHeight()
        print("Swift 5.2.4 available in this xCode 11.5")
    }
    
    fileprivate func setupWillAppear() {
        //here all functions in this lifecycles of VC
    }
    
    fileprivate func setupDidAppear() {
        //here all functions in this lifecycles of VC
    }
    
    fileprivate func setupWillDisappear() {
        //here all functions in this lifecycles of VC
    }
    
    fileprivate func setupDidDisappear() {
        //here all functions in this lifecycles of VC
    }
    
    fileprivate func setupConfigurator()  {
        //configurator
    }
    
    fileprivate func setupFirstPresenter() {
        //all presenter
        //example:
        //self.presenter.getText()
    }
    
    func validateHeight() {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iphone 5, 5c, 5s(1 generacion)")
                return
            case 1334:
                print("iphone 6,7,8, 5s(2 generacion)")
                return
            case 1920, 2208:
                print("iphone 6 plus, 7 plus, 8 plus")
                return
            case 2436:
                print("Iphone X, XS, 11Pro")
                return
            case 2688:
                print("Iphone XS Max, 11 Pro Max")
                return
            case 1792:
                print("Iphone XR, 11")
                return
            default:
                return
            }
        }
    }
}

extension FirstViewController: FirstViewControllerProtocol {
    func getText(string: String?) -> String {
        //nil collasting
        return (string != nil) ? (string ?? "") : ""
    }
}

//Luego si hay un TableView, CollectionnView, TextField, Gesture, CoreLocation, etc:
//creamos el nombre de la clase + el protocolo
//ejemplo:
//FirstViewController:
//First+UITableView
//First+UICollectionView
//First+UITextField
//en pocas palabras guiarse de directo, ya que ahi esta todo
