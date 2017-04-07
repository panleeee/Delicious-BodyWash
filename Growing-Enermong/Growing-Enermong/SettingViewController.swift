//
//  SettingViewController.swift
//  Growing-Enermong
//
//  Created by   minjae on 2017. 4. 7..
//  Copyright © 2017년 minjae. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var alarm: UILabel!
    @IBOutlet weak var randomBox: UILabel!
    
    @IBOutlet weak var box1Text: UITextField!
    @IBOutlet weak var box2Text: UITextField!
    @IBOutlet weak var box3Text: UITextField!
    @IBOutlet weak var box4Text: UITextField!
    @IBOutlet weak var box5Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alarm.text = "알림"
        self.randomBox.text = "랜덤 상자 보상"
        self.alarmSwitch.backgroundColor=UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        self.alarmSwitch.layer.cornerRadius = 16.0
        self.alarmSwitch.thumbTintColor=UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardUP(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDown(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#ffd200ff")
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func keyboardUP(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y = 0
            self.view.frame.origin.y -= 130
        }
    }
    
    func keyboardDown(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y = 0
        }
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        box1Text.endEditing(true)
        box2Text.endEditing(true)
        box3Text.endEditing(true)
        box4Text.endEditing(true)
        box5Text.endEditing(true)
    }
    
    
}

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
