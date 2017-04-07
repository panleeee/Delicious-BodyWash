//
//  MainViewController.swift
//  Growing-Enermong
//
//  Created by 이씨안 on 2017. 4. 7..
//  Copyright © 2017년 minjae. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var customAlertView: UIView!
    @IBOutlet weak var customAlertLabel: UILabel!
    @IBOutlet weak var customAlertButton: UIButton!
    @IBOutlet weak var char: UIImageView!
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var boxImage: UIImageView!
    
    //////////////////////////////////////////////////////delegate Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.setValue(true, forKey: "hidesShadow")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        boxButton.isHidden = true
//        boxImage.isHidden = true
        customAlertView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //////////////////////////////////////////////////////Button Functions
    
    @IBAction func boxButtonTouch(_ sender: Any) {
        boxImage.isHidden = true
        boxButton.isHidden = true
        customAlertView.isHidden = false
        
        //랜덤으로 뽑힌 보상 값 customAlertLabel에 출력하기
    }
    
    @IBAction func customAlertButtonTouch(_ sender: Any) {
        customAlertView.isHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
