//
//  KeyBoardViewController2.swift
//  Practica
//
//  Created by Daruchi on 6/9/20.
//  Copyright © 2020 Daruchi. All rights reserved.
//

import UIKit

class KeyBoardViewController2: UIViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var inView: UIView!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourTextField: UITextField!
    @IBOutlet weak var fiveTextField: UITextField!
    @IBOutlet weak var sixTextField: UITextField!
    @IBOutlet weak var sevenTextField: UITextField!
    @IBOutlet weak var eightTextField: UITextField!
    @IBOutlet weak var nineTextField: UITextField!
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
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

extension KeyBoardViewController2 {
    fileprivate func setupViewDidLoad() {
        self.validateHeight()
        self.initTextField()
        self.initKeyboard()
        print("Swift 5.2.4 available in this xCode 11.5")
    }
    
    fileprivate func initTextField() {
        self.firstTextField.delegate = self
        self.secondTextField.delegate = self
        self.thirdTextField.delegate = self
        self.fourTextField.delegate = self
        self.fiveTextField.delegate = self
        self.sixTextField.delegate = self
        self.sevenTextField.delegate = self
        self.eightTextField.delegate = self
        self.nineTextField.delegate = self
        self.firstTextField.autocorrectionType =  .no
        self.secondTextField.autocorrectionType =  .no
        self.thirdTextField.autocorrectionType = .no
        self.fourTextField.autocorrectionType = .no
        self.fiveTextField.autocorrectionType = .no
        self.sixTextField.autocorrectionType = .no
        self.sevenTextField.autocorrectionType = .no
        self.eightTextField.autocorrectionType = .no
        self.nineTextField.autocorrectionType = .no
        //self.eightTextField.keyboardType = .numberPad
        //self.nineTextField.keyboardType = .numberPad
        //para acción
        self.nineTextField.addTarget(self, action: #selector(changedKeyboard), for: UIControl.Event.touchDown)
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
            //self.lastNameTextField.resignFirstResponder()
            self.view.endEditing(true)
        }
        
        @objc fileprivate func changedKeyboard() {
            print("chambio")
            //self.lastNameTextField.keyboardType = .numberPad
        }
    
    func initGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyBoardViewController2.dismissKeyBoard))
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

extension KeyBoardViewController2: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.firstTextField {
            self.secondTextField.becomeFirstResponder()
        } else if textField == self.secondTextField {
            self.thirdTextField.becomeFirstResponder()
        } else if textField == self.thirdTextField {
            self.fourTextField.becomeFirstResponder()
        } else if textField == fourTextField {
            self.fiveTextField.becomeFirstResponder()
        } else if textField == fiveTextField {
            self.sixTextField.becomeFirstResponder()
        } else if textField == sixTextField {
            self.sevenTextField.becomeFirstResponder()
        } else if textField == sevenTextField {
            self.eightTextField.becomeFirstResponder()
        } else if textField == eightTextField {
            self.nineTextField.becomeFirstResponder()
        } else if textField == self.nineTextField {
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
