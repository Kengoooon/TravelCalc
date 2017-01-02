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
    
    @IBAction func memberButton(_ sender: UIButton) {
        bouderClear()
        memberButton.layer.borderWidth = 2;
        memberButton.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 1
    }
    @IBAction func acostButton(_ sender: UIButton) {
        bouderClear()
        acostButton.layer.borderWidth = 2;
        acostButton.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 2
    }
    @IBAction func bcostButton(_ sender: UIButton) {
        bouderClear()
        bcostButton.layer.borderWidth = 2;
        bcostButton.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 3
    }
    @IBAction func ccostButton(_ sender: UIButton) {
        bouderClear()
        ccostButton.layer.borderWidth = 2;
        ccostButton.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = 4
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
                data.percost = (Int(data.cost)! / Int(data.member)!)
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
                data.percost = (Int(data.cost)! / Int(data.member)!)
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
                data.percost = (Int(data.cost)! / Int(data.member)!)
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
        memberButton.layer.borderColor = UIColor.black.cgColor
        acostButton.layer.borderColor = UIColor.black.cgColor
        bcostButton.layer.borderColor = UIColor.black.cgColor
        ccostButton.layer.borderColor = UIColor.black.cgColor
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
