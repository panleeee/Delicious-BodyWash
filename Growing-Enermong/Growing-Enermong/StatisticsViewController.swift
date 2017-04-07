//
//  StatisticsViewController.swift
//  Growing-Enermong
//
//  Created by 이씨안 on 2017. 4. 7..
//  Copyright © 2017년 minjae. All rights reserved.
//

import UIKit
import ScrollableGraphView

class StatisticsViewController: UIViewController {

    @IBOutlet weak var graghView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 210/255, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        tabBarController?.selectedIndex=1
        // Do any additional setup after loading the view.
        let graphView = ScrollableGraphView(frame: CGRect(x: 24, y: 120, width: 272, height: 160))
        let data: [Double] = [4, 8, 15, 16, 23, 42]
        let labels = ["one", "two", "three", "four", "five", "six"]
        
        graphView.backgroundFillColor = UIColor.gray
        
        graphView.rangeMax = 50
        
        graphView.lineWidth = 1
        graphView.lineColor = UIColor.darkGray
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        graphView.shouldFill = true
        graphView.fillType = ScrollableGraphViewFillType.gradient
        graphView.fillColor = UIColor.red
        graphView.fillGradientType = ScrollableGraphViewGradientType.linear
        graphView.fillGradientStartColor = UIColor.orange
        graphView.fillGradientEndColor = UIColor.orange
        
        graphView.dataPointSpacing = 80
        graphView.dataPointSize = 2
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        graphView.set(data: data, withLabels: labels)
        self.view.addSubview(graphView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
