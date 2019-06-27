//
//  ViewController.swift
//  TestTask
//
//  Created by Артем Шпилька on 27.06.19.
//  Copyright © 2019 Артем Шпилька. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lowerTextField: UITextField!
    @IBOutlet weak var upperTextField: UITextField!
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lowerTextField.tag = 0
        upperTextField.tag = 1
        acceptButton.layer.cornerRadius = 5
        eraseButton.layer.cornerRadius = 5
        
        lowerTextField.delegate = self
        upperTextField.delegate = self
        
        let tapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(self.closeKeyboard))
        view.addGestureRecognizer(tapToCloseKeyboard)
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func acceptButtonAction(_ sender: UIButton) {
        if isValid(lBound: lowerTextField.text, uBound: upperTextField.text){
            let commentsViewController = CommentsViewController()
            commentsViewController.lowerBound = Int(lowerTextField.text!)!
            commentsViewController.upperBound = Int(upperTextField.text!)!
            self.navigationController?.pushViewController(commentsViewController, animated: true)
        }else{
            let alert = UIAlertController(title: "Error", message: "Input data is invalid", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func eraseButtonAction(_ sender: UIButton) {
        lowerTextField.text = ""
        upperTextField.text = ""
    }
    
    func isValid(lBound t1: String?, uBound t2: String?) -> Bool{
        var lbInt = 0
        var ubInt = 0
        
        if let lb = t1{
            if lb == ""{
                return false
            }
            lbInt = Int(lb) ?? 0
        }
        else{
            return false
        }
        if let ub = t2{
            if ub == ""{
                return false
            }
            ubInt = Int(ub) ?? 0
        }
        else{
            return false
        }
        
        if lbInt == 0 || ubInt == 0{
            return false
        }

        if lbInt > ubInt{
            return false
        }
        
        return true
    }
}


extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}









