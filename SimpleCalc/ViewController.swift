//
//  ViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2016/12/22.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tag:Int = 0
    var cost:String = ""
    var member:String = ""

    @IBOutlet weak var costLabel: UITextField!
    @IBOutlet weak var membercountLabel: UITextField!
    @IBOutlet weak var AfixLabel: UITextField!
    @IBOutlet weak var BfixLabel: UITextField!
    @IBOutlet weak var CfixLabel: UITextField!
    @IBOutlet weak var AfixcostLabel: UITextField!
    @IBOutlet weak var BfixcostLabel: UITextField!
    @IBOutlet weak var CfixcostLabel: UITextField!
    
    @IBAction func costLabel(_ sender: UITextField) {
        tag = 1
        cost = ""
    }
    @IBAction func membercountLabel(_ sender: UITextField) {
        tag = 2
        member = ""
    }

    @IBAction func AfixLabel(_ sender: UITextField) {
        tag = 3
        member = ""
    }
    
    @IBAction func BfixLabel(_ sender: UITextField) {
        tag = 5
        member = ""
    }
    
    @IBAction func CfixLabel(_ sender: UITextField) {
        tag = 7
        member = ""
    }
    @IBAction func AfixcostLabel(_ sender: UITextField) {
        tag = 4
        cost = ""
    }
    @IBAction func BfixcostLabel(_ sender: UITextField) {
        tag = 6
        cost = ""
    }
    @IBAction func CfixcostLabel(_ sender: UITextField) {
        tag = 8
        cost = ""
    }
    
    @IBAction func oneBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "1"
            costLabel.text = cost
        case 2:
            member += "1"
            membercountLabel.text = member
        case 3:
            member += "1"
            AfixLabel.text = member
        case 4:
            cost += "1"
            AfixcostLabel.text = cost
        case 5:
            member += "1"
            BfixLabel.text = member
        case 6:
            cost += "1"
            BfixcostLabel.text = cost
        case 7:
            member += "1"
            CfixLabel.text = member
        case 8:
            cost += "1"
            CfixcostLabel.text = cost
        default: break
        }
    }
    @IBAction func twoBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "2"
            costLabel.text = cost
        case 2:
            member += "2"
            membercountLabel.text = member
        case 3:
            member += "2"
            AfixLabel.text = member
        case 4:
            cost += "2"
            AfixcostLabel.text = cost
        case 5:
            member += "2"
            BfixLabel.text = member
        case 6:
            cost += "2"
            BfixcostLabel.text = cost
        case 7:
            member += "2"
            CfixLabel.text = member
        case 8:
            cost += "2"
            CfixcostLabel.text = cost
        default: break
        }
    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "3"
            costLabel.text = cost
        case 2:
            member += "3"
            membercountLabel.text = member
        case 3:
            member += "3"
            AfixLabel.text = member
        case 4:
            cost += "3"
            AfixcostLabel.text = cost
        case 5:
            member += "3"
            BfixLabel.text = member
        case 6:
            cost += "3"
            BfixcostLabel.text = cost
        case 7:
            member += "3"
            CfixLabel.text = member
        case 8:
            cost += "3"
            CfixcostLabel.text = cost
        default: break
        }
    }

    @IBAction func fourBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "4"
            costLabel.text = cost
        case 2:
            member += "4"
            membercountLabel.text = member
        case 3:
            member += "4"
            AfixLabel.text = member
        case 4:
            cost += "4"
            AfixcostLabel.text = cost
        case 5:
            member += "4"
            BfixLabel.text = member
        case 6:
            cost += "4"
            BfixcostLabel.text = cost
        case 7:
            member += "4"
            CfixLabel.text = member
        case 8:
            cost += "4"
            CfixcostLabel.text = cost
        default: break
        }
    }
    @IBAction func fiveBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "5"
            costLabel.text = cost
        case 2:
            member += "5"
            membercountLabel.text = member
        case 3:
            member += "5"
            AfixLabel.text = member
        case 4:
            cost += "5"
            AfixcostLabel.text = cost
        case 5:
            member += "5"
            BfixLabel.text = member
        case 6:
            cost += "5"
            BfixcostLabel.text = cost
        case 7:
            member += "5"
            CfixLabel.text = member
        case 8:
            cost += "5"
            CfixcostLabel.text = cost
        default: break
        }
    }
    @IBAction func sixBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "6"
            costLabel.text = cost
        case 2:
            member += "6"
            membercountLabel.text = member
        case 3:
            member += "6"
            AfixLabel.text = member
        case 4:
            cost += "6"
            AfixcostLabel.text = cost
        case 5:
            member += "6"
            BfixLabel.text = member
        case 6:
            cost += "6"
            BfixcostLabel.text = cost
        case 7:
            member += "6"
            CfixLabel.text = member
        case 8:
            cost += "6"
            CfixcostLabel.text = cost
        default: break
        }
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "7"
            costLabel.text = cost
        case 2:
            member += "7"
            membercountLabel.text = member
        case 3:
            member += "7"
            AfixLabel.text = member
        case 4:
            cost += "7"
            AfixcostLabel.text = cost
        case 5:
            member += "7"
            BfixLabel.text = member
        case 6:
            cost += "7"
            BfixcostLabel.text = cost
        case 7:
            member += "7"
            CfixLabel.text = member
        case 8:
            cost += "7"
            CfixcostLabel.text = cost
        default: break
        }
    }
    @IBAction func eightBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "8"
            costLabel.text = cost
        case 2:
            member += "8"
            membercountLabel.text = member
        case 3:
            member += "8"
            AfixLabel.text = member
        case 4:
            cost += "8"
            AfixcostLabel.text = cost
        case 5:
            member += "8"
            BfixLabel.text = member
        case 6:
            cost += "8"
            BfixcostLabel.text = cost
        case 7:
            member += "8"
            CfixLabel.text = member
        case 8:
            cost += "8"
            CfixcostLabel.text = cost
        default: break
        }
    }
    @IBAction func nineBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "9"
            costLabel.text = cost
        case 2:
            member += "9"
            membercountLabel.text = member
        case 3:
            member += "9"
            AfixLabel.text = member
        case 4:
            cost += "9"
            AfixcostLabel.text = cost
        case 5:
            member += "9"
            BfixLabel.text = member
        case 6:
            cost += "9"
            BfixcostLabel.text = cost
        case 7:
            member += "9"
            CfixLabel.text = member
        case 8:
            cost += "9"
            CfixcostLabel.text = cost
        default: break
        }
    }
    @IBAction func zeroBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "0"
            costLabel.text = cost
        case 2:
            member += "0"
            membercountLabel.text = member
        case 3:
            member += "0"
            AfixLabel.text = member
        case 4:
            cost += "0"
            AfixcostLabel.text = cost
        case 5:
            member += "0"
            BfixLabel.text = member
        case 6:
            cost += "0"
            BfixcostLabel.text = cost
        case 7:
            member += "0"
            CfixLabel.text = member
        case 8:
            cost += "0"
            CfixcostLabel.text = cost
        default: break
        }
    }
    @IBAction func zerozeroBtn(_ sender: UIButton) {
        switch tag{
        case 1:
            cost += "0"
            cost += "0"
            costLabel.text = cost
        case 2:
            member += "0"
            member += "0"
            membercountLabel.text = member
        case 3:
            member += "0"
            member += "0"
            AfixLabel.text = member
        case 4:
            cost += "0"
            cost += "0"
            AfixcostLabel.text = cost
        case 5:
            member += "0"
            member += "0"
            BfixLabel.text = member
        case 6:
            cost += "0"
            cost += "0"
            BfixcostLabel.text = cost
        case 7:
            member += "0"
            member += "0"
            CfixLabel.text = member
        case 8:
            cost += "0"
            cost += "0"
            CfixcostLabel.text = cost
        default: break
        }
    }
    
    @IBAction func resuleBtn(_ sender: UIButton) {
        Int(AfixLabel.text!)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

