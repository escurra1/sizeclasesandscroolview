//
//  KeyBoardViewController.swift
//  Practica
//
//  Created by Daruchi on 6/9/20.
//  Copyright © 2020 Daruchi. All rights reserved.
//

import UIKit

class KeyBoardViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.validateHeight()
        self.initTextField()
        self.initKeyboard()
        print("Swift 5.2.4 available in this xCode 11.5")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initGestureRecognizer()
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func didTapPressButton(_ sender: UIButton) {
        self.didTapKeyboardButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    deinit {
        print("Dellactoc class")
    }
}

extension KeyBoardViewController {
    fileprivate func initTextField() {
        self.nameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.nameTextField.autocorrectionType =  .no
        //self.lastNameTextField.autocorrectionType =  .no
        //para acción
        self.lastNameTextField.keyboardType = .numberPad
        lastNameTextField.addTarget(self, action: #selector(changedKeyboard), for: UIControl.Event.touchDown)
    }
    
    fileprivate func initKeyboard() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardTextField(notificacion:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardTextField(notificacion:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardTextField(notificacion:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        }
        
        @objc fileprivate func keyboardTextField(notificacion: Notification) {
            guard let tecladoUp = (notificacion.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
            }
            
            if notificacion.name == UIResponder.keyboardWillShowNotification {
                self.view.frame.origin.y = -tecladoUp.height
            } else {
                //posición original del teclado
                self.view.frame.origin.y = 0
            }
        }
        
        fileprivate func didTapKeyboardButton() {
            self.view.endEditing(true)
        }
        
        @objc fileprivate func changedKeyboard() {
            print("chambio")
            //self.lastNameTextField.keyboardType = .numberPad
        }
    
    func initGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyBoardViewController.dismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
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

extension KeyBoardViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTextField {
            self.lastNameTextField.becomeFirstResponder()
        } else if textField == self.lastNameTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        NSLog("textFieldDidBeginEditing")
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.resignFirstResponder()
        NSLog("textFieldDidEndEditing")
        activeField = nil
    }
}
