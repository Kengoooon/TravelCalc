//
//  Post-settlementViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2017/01/01.
//  Copyright © 2017年 kengo. All rights reserved.
//

import UIKit

class Post_settlementViewController: UIViewController {
    
    @IBOutlet weak var membercountLabel: UILabel!
    @IBOutlet weak var AcostLabel: UILabel!
    @IBOutlet weak var BcostLabel: UILabel!
    @IBOutlet weak var CcostLabel: UILabel!
    @IBOutlet weak var anameLabel: UITextField!
    @IBOutlet weak var bnameLabel: UITextField!
    @IBOutlet weak var cnameLabel: UITextField!
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var acostButton: UIButton!
    @IBOutlet weak var bcostButton: UIButton!
    @IBOutlet weak var ccostButton: UIButton!
    
    var data = CalcData()
    var count: Int = 0
    var endPoint: Int = 0
    
    
    @IBAction func back(segue:UIStoryboardSegue){//戻るボタン用
        print("back")
    }
    
    @IBAction func memberButton(_ sender: UIButton) {
        bouderClear()
        memberButton.layer.borderWidth = 2;
        memberButton.layer.borderColor = UIColor.red.cgColor
        membercountLabel.layer.borderWidth = 2;
        membercountLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 1
    }
    @IBAction func acostButton(_ sender: UIButton) {
        bouderClear()
        acostButton.layer.borderWidth = 2;
        acostButton.layer.borderColor = UIColor.red.cgColor
        AcostLabel.layer.borderWidth = 2;
        AcostLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 2
    }
    @IBAction func bcostButton(_ sender: UIButton) {
        bouderClear()
        bcostButton.layer.borderWidth = 2;
        bcostButton.layer.borderColor = UIColor.red.cgColor
        BcostLabel.layer.borderWidth = 2;
        BcostLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 3
    }
    @IBAction func ccostButton(_ sender: UIButton) {
        bouderClear()
        ccostButton.layer.borderWidth = 2;
        ccostButton.layer.borderColor = UIColor.red.cgColor
        CcostLabel.layer.borderWidth = 2;
        CcostLabel.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 4
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
    
    
    @IBAction func oneButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "1"
            membercountLabel.text = data.member
        case 2:
            data.acost += "1"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "1"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "1"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func twoButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "2"
            membercountLabel.text = data.member
        case 2:
            data.acost += "2"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "2"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "2"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func threeButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "3"
            membercountLabel.text = data.member
        case 2:
            data.acost += "3"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "3"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "3"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func fourButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "4"
            membercountLabel.text = data.member
        case 2:
            data.acost += "4"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "4"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "4"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func fiveButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "5"
            membercountLabel.text = data.member
        case 2:
            data.acost += "5"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "5"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "5"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func sixButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "6"
            membercountLabel.text = data.member
        case 2:
            data.acost += "6"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "6"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "6"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func sevenButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "7"
            membercountLabel.text = data.member
        case 2:
            data.acost += "7"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "7"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "7"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func eightButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "8"
            membercountLabel.text = data.member
        case 2:
            data.acost += "8"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "8"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "8"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func nineButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "9"
            membercountLabel.text = data.member
        case 2:
            data.acost += "9"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "9"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "9"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func zeroButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "0"
            membercountLabel.text = data.member
        case 2:
            data.acost += "0"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "0"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "0"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func zerozeroButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            data.member += "00"
            membercountLabel.text = data.member
        case 2:
            data.acost += "00"
            AcostLabel.text = data.acost
        case 3:
            data.bcost += "00"
            BcostLabel.text = data.bcost
        case 4:
            data.ccost += "00"
            CcostLabel.text = data.ccost
        default: break
        }
    }
    @IBAction func AllClearButton(_ sender: UIButton) {
//        bouderClear()
//        data.cost = ""
//        data.member = ""
//        data.acost = ""
//        data.bcost = ""
//        data.ccost = ""
//        data.inputFlag = 0
//        data.indicator = 0
//        data.paymember = 0
//        data.percost = 0
//        data.apayFlag = 0
//        data.bpayFlag = 0
//        data.cpayFlag = 0
//        data.aname = ""
//        data.bname = ""
//        data.cname = ""
//        membercountLabel.text = ""
//        AcostLabel.text = ""
//        BcostLabel.text = ""
//        CcostLabel.text = ""
//        anameLabel.text = ""
//        bnameLabel.text = ""
//        cnameLabel.text = ""
        
        switch data.inputFlag {
        case 1:
            if data.member != ""{
            count = Int(data.member.characters.count)
            endPoint = count - 1
            data.member = data.member.substring(with: data.member.index(data.member.startIndex, offsetBy: 0)..<data.member.index(data.member.startIndex, offsetBy: endPoint))
            membercountLabel.text = data.member
            }
        case 2:
            if data.acost != ""{
                count = Int(data.acost.characters.count)
                endPoint = count - 1
                data.acost = data.acost.substring(with: data.acost.index(data.acost.startIndex, offsetBy: 0)..<data.acost.index(data.acost.startIndex, offsetBy: endPoint))
                AcostLabel.text = data.acost
            }
        case 3:
            if data.bcost != ""{
                count = Int(data.bcost.characters.count)
                endPoint = count - 1
                data.bcost = data.bcost.substring(with: data.bcost.index(data.bcost.startIndex, offsetBy: 0)..<data.bcost.index(data.bcost.startIndex, offsetBy: endPoint))
                BcostLabel.text = data.bcost
            }
        case 4:
            if data.ccost != ""{
                count = Int(data.ccost.characters.count)
                endPoint = count - 1
                data.ccost = data.ccost.substring(with: data.ccost.index(data.ccost.startIndex, offsetBy: 0)..<data.ccost.index(data.ccost.startIndex, offsetBy: endPoint))
                CcostLabel.text = data.ccost
            }
            
        default: break
        }
    }
    
    
    @IBAction func resultButton(_ sender: UIButton) {
        data.indicator = 1
        
        //支払者Aの金額を入力している場合に遷移
        if data.acost != "" {
            //支払者Aにしか入力がない場合
            if data.bcost == "" && data.ccost == "" {
                //Aの名前をdata.anameに格納
                if anameLabel.text != ""{
                    data.aname = anameLabel.text!
                }else{
                    data.aname = "A"
                }
                //お会計の総額を算出
                data.cost = data.acost
                print(data)
                //一人当たりの支払金額を算出
                if membercountLabel.text != "0"{
                    data.percost = (Int(data.cost)! / Int(data.member)!)
                }else{
                    data.errorFlag = 1
                }
                
                //立て替えした人数を代入
                data.paymember = 1
                //支払者AとBに入力がある場合
            }else if data.ccost == ""{
                //AとBの名前をdata.nameに格納
                if anameLabel.text != ""{
                    data.aname = anameLabel.text!
                }else{
                    data.aname = "A"
                }
                if bnameLabel.text != ""{
                    data.bname = bnameLabel.text!
                }else{
                    data.bname = "B"
                }
                //お会計の総額を算出
                data.cost = String(Int(data.acost)! + Int(data.bcost)!)
                //一人当たりの支払金額を算出
                if membercountLabel.text != "0"{
                data.percost = (Int(data.cost)! / Int(data.member)!)
                }else{
                    data.errorFlag = 1
                }
                
                //立て替えした人数を代入
                data.paymember = 2
                
                //支払金額が一人当たりの支払金額以下だった場合，その人の支払フラグを立てる
                if Int(data.acost)! < data.percost {
                    data.apayFlag = 1
                }
                if Int(data.bcost)! < data.percost{
                    data.bpayFlag = 1
                }
                //支払者AとBとCに入力がある場合
            }else{
                //AとBとCの名前をdata.nameに格納
                if anameLabel.text != ""{
                    data.aname = anameLabel.text!
                }else{
                    data.aname = "A"
                }
                if bnameLabel.text != ""{
                    data.bname = bnameLabel.text!
                }else{
                    data.bname = "B"
                }
                if cnameLabel.text != ""{
                    data.cname = cnameLabel.text!
                }else{
                    data.cname = "C"
                }
                //お会計の総額を算出
                data.cost = String(Int(data.acost)! + Int(data.bcost)! + Int(data.ccost)!)
                //一人当たりの支払金額を算出
                if membercountLabel.text != "0"{
                    data.percost = (Int(data.cost)! / Int(data.member)!)
                }else{
                    data.errorFlag = 1
                }
                //立て替えした人数を代入
                data.paymember = 3
                //支払金額が一人当たりの支払金額以下だった場合，その人の支払フラグを立てる
                if Int(data.acost)! < data.percost {
                    data.apayFlag = 1
                }
                if Int(data.bcost)! < data.percost{
                    data.bpayFlag = 1
                }
                if Int(data.ccost)! < data.percost{
                    data.cpayFlag = 1
                }
            }
            //支払者Aに入力がない時の処理
        }else{
            
        }
    }
    
    //罫線をデフォルト値に戻す関数
    func bouderClear() -> (){
        memberButton.layer.borderWidth = 1;
        acostButton.layer.borderWidth = 1;
        bcostButton.layer.borderWidth = 1;
        ccostButton.layer.borderWidth = 1;
        membercountLabel.layer.borderWidth = 1;
        AcostLabel.layer.borderWidth = 1;
        BcostLabel.layer.borderWidth = 1;
        CcostLabel.layer.borderWidth = 1;
        memberButton.layer.borderColor = UIColor.black.cgColor
        acostButton.layer.borderColor = UIColor.black.cgColor
        bcostButton.layer.borderColor = UIColor.black.cgColor
        ccostButton.layer.borderColor = UIColor.black.cgColor
        membercountLabel.layer.borderColor = UIColor.black.cgColor
        AcostLabel.layer.borderColor = UIColor.black.cgColor
        BcostLabel.layer.borderColor = UIColor.black.cgColor
        CcostLabel.layer.borderColor = UIColor.black.cgColor
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
        
        membercountLabel.isUserInteractionEnabled = true
        AcostLabel.isUserInteractionEnabled = true
        BcostLabel.isUserInteractionEnabled = true
        CcostLabel.isUserInteractionEnabled = true

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                bouderClear()
                memberButton.layer.borderWidth = 2;
                memberButton.layer.borderColor = UIColor.red.cgColor
                membercountLabel.layer.borderWidth = 2;
                membercountLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 1
            case 2:
                bouderClear()
                acostButton.layer.borderWidth = 2;
                acostButton.layer.borderColor = UIColor.red.cgColor
                AcostLabel.layer.borderWidth = 2;
                AcostLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 2
                
            case 3:
                bouderClear()
                bcostButton.layer.borderWidth = 2;
                bcostButton.layer.borderColor = UIColor.red.cgColor
                BcostLabel.layer.borderWidth = 2;
                BcostLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 3
            case 4:
                bouderClear()
                ccostButton.layer.borderWidth = 2;
                ccostButton.layer.borderColor = UIColor.red.cgColor
                CcostLabel.layer.borderWidth = 2;
                CcostLabel.layer.borderColor = UIColor.red.cgColor
                data.inputFlag = 4
            default:
                break
            }
            if (self.anameLabel.isFirstResponder) {
                self.anameLabel.resignFirstResponder()
            }
            if (self.bnameLabel.isFirstResponder) {
                self.bnameLabel.resignFirstResponder()
            }
            if (self.cnameLabel.isFirstResponder) {
                self.cnameLabel.resignFirstResponder()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
