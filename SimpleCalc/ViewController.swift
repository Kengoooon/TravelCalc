//
//  ViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2016/12/22.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit

var cost:String = ""
var member:String = ""
var acost:String = ""
var bcost:String = ""
var ccost:String = ""
var inputFlag:Int = 0

class ViewController: UIViewController {

    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var membercountLabel: UILabel!
    @IBOutlet weak var AfixLabel: UILabel!
    @IBOutlet weak var BfixLabel: UILabel!
    @IBOutlet weak var CfixLabel: UILabel!

    @IBAction func costButton(_ sender: UIButton) {
        inputFlag = 1
    }
    @IBAction func memberButton(_ sender: UIButton) {
        inputFlag = 2
    }
    
    @IBAction func AfixButton(_ sender: UIButton) {
        inputFlag = 3
    }
    @IBAction func BfixButton(_ sender: UIButton) {
        inputFlag = 4
    }
    @IBAction func CfixButton(_ sender: UIButton) {
        inputFlag = 5
    }
    
    
    @IBAction func oneBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "1"
            costLabel.text = cost
        case 2:
            member += "1"
            membercountLabel.text = member
        case 3:
            acost += "1"
            AfixLabel.text = acost
        case 4:
            bcost += "1"
            BfixLabel.text = bcost
        case 5:
            ccost += "1"
            CfixLabel.text = ccost
        default: break
        }
    }
    @IBAction func twoBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "2"
            costLabel.text = cost
        case 2:
            member += "2"
            membercountLabel.text = member
        case 3:
            acost += "2"
            AfixLabel.text = acost
        case 4:
            bcost += "2"
            BfixLabel.text = bcost
        case 5:
            ccost += "2"
            CfixLabel.text = ccost
        default: break
        }    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "3"
            costLabel.text = cost
        case 2:
            member += "3"
            membercountLabel.text = member
        case 3:
            acost += "3"
            AfixLabel.text = acost
        case 4:
            bcost += "3"
            BfixLabel.text = bcost
        case 5:
            ccost += "3"
            CfixLabel.text = ccost
        default: break
        }    }

    @IBAction func fourBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "4"
            costLabel.text = cost
        case 2:
            member += "4"
            membercountLabel.text = member
        case 3:
            acost += "4"
            AfixLabel.text = acost
        case 4:
            bcost += "4"
            BfixLabel.text = bcost
        case 5:
            ccost += "4"
            CfixLabel.text = ccost
        default: break
        }
    }
    @IBAction func fiveBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "5"
            costLabel.text = cost
        case 2:
            member += "5"
            membercountLabel.text = member
        case 3:
            acost += "5"
            AfixLabel.text = acost
        case 4:
            bcost += "5"
            BfixLabel.text = bcost
        case 5:
            ccost += "5"
            CfixLabel.text = ccost
        default: break
        }
    }
    @IBAction func sixBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "6"
            costLabel.text = cost
        case 2:
            member += "6"
            membercountLabel.text = member
        case 3:
            acost += "6"
            AfixLabel.text = acost
        case 4:
            bcost += "6"
            BfixLabel.text = bcost
        case 5:
            ccost += "6"
            CfixLabel.text = ccost
        default: break
        }
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "7"
            costLabel.text = cost
        case 2:
            member += "7"
            membercountLabel.text = member
        case 3:
            acost += "7"
            AfixLabel.text = acost
        case 4:
            bcost += "7"
            BfixLabel.text = bcost
        case 5:
            ccost += "7"
            CfixLabel.text = ccost
        default: break
        }    }
    @IBAction func eightBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "8"
            costLabel.text = cost
        case 2:
            member += "8"
            membercountLabel.text = member
        case 3:
            acost += "8"
            AfixLabel.text = acost
        case 4:
            bcost += "8"
            BfixLabel.text = bcost
        case 5:
            ccost += "8"
            CfixLabel.text = ccost
        default: break
        }
    }
    @IBAction func nineBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            cost += "9"
            costLabel.text = cost
        case 2:
            member += "9"
            membercountLabel.text = member
        case 3:
            acost += "9"
            AfixLabel.text = acost
        case 4:
            bcost += "9"
            BfixLabel.text = bcost
        case 5:
            ccost += "9"
            CfixLabel.text = ccost
        default: break
        }
    }
    @IBAction func zeroBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            if cost != ""{
            cost += "0"
            costLabel.text = cost
            }
        case 2:
            if member != ""{
            member += "0"
            membercountLabel.text = member
            }
        case 3:
            if acost != ""{
            acost += "0"
            AfixLabel.text = acost
            }
        case 4:
            if bcost != ""{
            bcost += "0"
            BfixLabel.text = bcost
            }
        case 5:
            if ccost != ""{
            ccost += "0"
            CfixLabel.text = ccost
            }
        default: break
        }
    }
    @IBAction func zerozeroBtn(_ sender: UIButton) {
        switch inputFlag{
        case 1:
            if cost != ""{
                cost += "00"
                costLabel.text = cost
            }
        case 2:
            if member != ""{
                member += "00"
                membercountLabel.text = member
            }
        case 3:
            if acost != ""{
                acost += "00"
                AfixLabel.text = acost
            }
        case 4:
            if bcost != ""{
                bcost += "00"
                BfixLabel.text = bcost
            }
        case 5:
            if ccost != ""{
                ccost += "00"
                CfixLabel.text = ccost
            }
        default: break
        }
    }
    
    @IBAction func resuleBtn(_ sender: UIButton) {
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            costLabel.text = cost
            membercountLabel.text = member
            AfixLabel.text = acost
            BfixLabel.text = bcost
            CfixLabel.text = ccost
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

