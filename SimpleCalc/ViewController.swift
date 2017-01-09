//
//  ViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2016/12/22.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit

struct CalcData{
    var cost: String = ""
    var member: String = ""
    var acost: String = ""
    var bcost: String = ""
    var ccost: String = ""
    var inputFlag: Int = 0
    var indicator: Int = 0
    var paymember: Int = 0
    var percost: Int = 0
    var apayFlag: Int = 0
    var bpayFlag: Int = 0
    var cpayFlag: Int = 0
    var aname: String = ""
    var bname: String = ""
    var cname: String = ""
    var roundingCost: Int = 1
    var errorFlag: Int = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var membercountLabel: UILabel!
    @IBOutlet weak var AfixLabel: UILabel!
    @IBOutlet weak var BfixLabel: UILabel!
    @IBOutlet weak var CfixLabel: UILabel!

    @IBOutlet weak var costButton: UIButton!
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var afixButton: UIButton!
    @IBOutlet weak var bfixButton: UIButton!
    @IBOutlet weak var cfixButton: UIButton!
    
    @IBOutlet weak var resultButton: UIButton!
    
    
    var data = CalcData()
    var count: Int = 0
    var endPoint: Int = 0
    
    @IBAction func back(segue:UIStoryboardSegue){//戻るボタン用
        print("back")
    }
    
    @IBAction func costButton(_ sender: UIButton) {
        bouderClear()
        costButton.layer.borderWidth = 2;
        costButton.layer.borderColor = UIColor.red.cgColor
        costLabel.layer.borderWidth = 2;
        costLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 1
    }
    @IBAction func memberButton(_ sender: UIButton) {
        bouderClear()
        memberButton.layer.borderWidth = 2;
        memberButton.layer.borderColor = UIColor.red.cgColor
        membercountLabel.layer.borderWidth = 2;
        membercountLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 2
    }
    
    @IBAction func afixButton(_ sender: UIButton) {
        bouderClear()
        afixButton.layer.borderWidth = 2;
        afixButton.layer.borderColor = UIColor.red.cgColor
        AfixLabel.layer.borderWidth = 2;
        AfixLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 3
    }
    
    @IBAction func bfixButton(_ sender: UIButton) {
        bouderClear()
        bfixButton.layer.borderWidth = 2;
        bfixButton.layer.borderColor = UIColor.red.cgColor
        BfixLabel.layer.borderWidth = 2;
        BfixLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 4
    }

    @IBAction func cfixButton(_ sender: UIButton) {
        bouderClear()
        cfixButton.layer.borderWidth = 2;
        cfixButton.layer.borderColor = UIColor.red.cgColor
        CfixLabel.layer.borderWidth = 2;
        CfixLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 5
    }
    
    
    @IBAction func roundingSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            data.roundingCost = 1
        case 1:
            data.roundingCost = 10
        case 2:
            data.roundingCost = 100
        case 3:
            data.roundingCost = 1000
        default:break
        }
    }
    
    
    
    @IBAction func oneBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "1"
            costLabel.text = data.cost
        case 2:
            data.member += "1"
            membercountLabel.text = data.member
        case 3:
            data.acost += "1"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "1"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "1"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func twoBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "2"
            costLabel.text = data.cost
        case 2:
            data.member += "2"
            membercountLabel.text = data.member
        case 3:
            data.acost += "2"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "2"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "2"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "3"
            costLabel.text = data.cost
        case 2:
            data.member += "3"
            membercountLabel.text = data.member
        case 3:
            data.acost += "3"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "3"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "3"
            CfixLabel.text = data.ccost
        default: break
        }
    }

    @IBAction func fourBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "4"
            costLabel.text = data.cost
        case 2:
            data.member += "4"
            membercountLabel.text = data.member
        case 3:
            data.acost += "4"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "4"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "4"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func fiveBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "5"
            costLabel.text = data.cost
        case 2:
            data.member += "5"
            membercountLabel.text = data.member
        case 3:
            data.acost += "5"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "5"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "5"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func sixBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "6"
            costLabel.text = data.cost
        case 2:
            data.member += "6"
            membercountLabel.text = data.member
        case 3:
            data.acost += "6"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "6"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "6"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "7"
            costLabel.text = data.cost
        case 2:
            data.member += "7"
            membercountLabel.text = data.member
        case 3:
            data.acost += "7"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "7"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "7"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func eightBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "8"
            costLabel.text = data.cost
        case 2:
            data.member += "8"
            membercountLabel.text = data.member
        case 3:
            data.acost += "8"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "8"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "8"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func nineBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.cost += "9"
            costLabel.text = data.cost
        case 2:
            data.member += "9"
            membercountLabel.text = data.member
        case 3:
            data.acost += "9"
            AfixLabel.text = data.acost
        case 4:
            data.bcost += "9"
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += "9"
            CfixLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func zeroBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            if data.cost != "0"{
            data.cost += "0"
            costLabel.text = data.cost
            }
        case 2:
            if data.cost != "0"{
            data.member += "0"
            membercountLabel.text = data.member
            }
        case 3:
            if data.cost != "0"{
            data.acost += "0"
            AfixLabel.text = data.acost
            }
        case 4:
            if data.cost != "0"{
            data.bcost += "0"
            BfixLabel.text = data.bcost
            }
        case 5:
            if data.cost != "0"{
            data.ccost += "0"
            CfixLabel.text = data.ccost
            }
        default: break
        }
    }
    @IBAction func zerozeroBtn(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            if data.cost != "" && data.cost != "0"{
            data.cost += "00"
            costLabel.text = data.cost
            }
        case 2:
            if data.cost != "" && data.cost != "0"{
            data.member += "00"
            membercountLabel.text = data.member
            }
        case 3:
            if data.cost != "" && data.cost != "0"{
            data.acost += "00"
            AfixLabel.text = data.acost
            }
        case 4:
            if data.cost != "" && data.cost != "0"{
            data.bcost += "00"
            BfixLabel.text = data.bcost
            }
        case 5:
            if data.cost != "" && data.cost != "0"{
            data.ccost += "00"
            CfixLabel.text = data.ccost
            }
        default: break
        }
    }
    @IBAction func backspaceButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            if data.cost != ""{
                count = Int(data.cost.characters.count)
                endPoint = count - 1
                data.cost = data.cost.substring(with: data.cost.index(data.cost.startIndex, offsetBy: 0)..<data.cost.index(data.cost.startIndex, offsetBy: endPoint))
                costLabel.text = data.cost
            }
        case 2:
            if data.member != ""{
                count = Int(data.member.characters.count)
                endPoint = count - 1
                data.member = data.member.substring(with: data.member.index(data.member.startIndex, offsetBy: 0)..<data.member.index(data.member.startIndex, offsetBy: endPoint))
                membercountLabel.text = data.member
            }
        case 3:
            if data.acost != ""{
                count = Int(data.acost.characters.count)
                endPoint = count - 1
                data.acost = data.acost.substring(with: data.acost.index(data.acost.startIndex, offsetBy: 0)..<data.acost.index(data.acost.startIndex, offsetBy: endPoint))
                AfixLabel.text = data.acost
            }
        case 4:
            if data.bcost != ""{
                count = Int(data.bcost.characters.count)
                endPoint = count - 1
                data.bcost = data.bcost.substring(with: data.bcost.index(data.bcost.startIndex, offsetBy: 0)..<data.bcost.index(data.bcost.startIndex, offsetBy: endPoint))
                BfixLabel.text = data.bcost
            }
        case 5:
            if data.ccost != ""{
                count = Int(data.ccost.characters.count)
                endPoint = count - 1
                data.ccost = data.ccost.substring(with: data.ccost.index(data.ccost.startIndex, offsetBy: 0)..<data.ccost.index(data.ccost.startIndex, offsetBy: endPoint))
                CfixLabel.text = data.ccost
            }
            
        default: break
        }
        
        
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        data.indicator = 0
//        data.acost = AfixLabel.text!
//        data.bcost = BfixLabel.text!
//        data.ccost = CfixLabel.text!
    }
    
    func bouderClear() -> (){
        costButton.layer.borderWidth = 1;
        memberButton.layer.borderWidth = 1;
        afixButton.layer.borderWidth = 1;
        bfixButton.layer.borderWidth = 1;
        cfixButton.layer.borderWidth = 1;
        costLabel.layer.borderWidth = 1;
        membercountLabel.layer.borderWidth = 1;
        AfixLabel.layer.borderWidth = 1;
        BfixLabel.layer.borderWidth = 1;
        CfixLabel.layer.borderWidth = 1;
        costButton.layer.borderColor = UIColor.black.cgColor
        memberButton.layer.borderColor = UIColor.black.cgColor
        afixButton.layer.borderColor = UIColor.black.cgColor
        bfixButton.layer.borderColor = UIColor.black.cgColor
        cfixButton.layer.borderColor = UIColor.black.cgColor
        costLabel.layer.borderColor = UIColor.black.cgColor
        membercountLabel.layer.borderColor = UIColor.black.cgColor
        AfixLabel.layer.borderColor = UIColor.black.cgColor
        BfixLabel.layer.borderColor = UIColor.black.cgColor
        CfixLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        
        if let destinationViewController = segue.destination as?
            ResultViewController {
            destinationViewController.data = data
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            costLabel.text = data.cost
            membercountLabel.text = data.member
            AfixLabel.text = data.acost
            BfixLabel.text = data.bcost
            CfixLabel.text = data.ccost
        
        costLabel.isUserInteractionEnabled = true
        membercountLabel.isUserInteractionEnabled = true
        AfixLabel.isUserInteractionEnabled = true
        BfixLabel.isUserInteractionEnabled = true
        CfixLabel.isUserInteractionEnabled = true
        //resultButton.isEnabled = false
    
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                bouderClear()
                costButton.layer.borderWidth = 2;
                costButton.layer.borderColor = UIColor.red.cgColor
                costLabel.layer.borderWidth = 2;
                costLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 1
            case 2:
                bouderClear()
                memberButton.layer.borderWidth = 2;
                memberButton.layer.borderColor = UIColor.red.cgColor
                membercountLabel.layer.borderWidth = 2;
                membercountLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 2
            case 3:
                bouderClear()
                afixButton.layer.borderWidth = 2;
                afixButton.layer.borderColor = UIColor.red.cgColor
                AfixLabel.layer.borderWidth = 2;
                AfixLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 3
            case 4:
                bouderClear()
                bfixButton.layer.borderWidth = 2;
                bfixButton.layer.borderColor = UIColor.red.cgColor
                BfixLabel.layer.borderWidth = 2;
                BfixLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 4
            case 5:
                bouderClear()
                cfixButton.layer.borderWidth = 2;
                cfixButton.layer.borderColor = UIColor.red.cgColor
                CfixLabel.layer.borderWidth = 2;
                CfixLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 5
            default:
                break
            }
        }
    }


}

