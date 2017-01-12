//
//  Post-settlementViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2017/01/01.
//  Copyright © 2017年 kengo. All rights reserved.
//

import UIKit

class Post_settlementViewController: UIViewController,UITextViewDelegate{
    
    @IBOutlet weak var backgroundView: UIView!
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
    
    //結果画面の前のページに戻るボタン用
    @IBAction func back(segue:UIStoryboardSegue){
        print("back")
    }
    
    func highlight(button: UIButton, label: UILabel, source: InputSource) {
        bouderClear()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2;
        label.layer.borderColor = UIColor.red.cgColor
        inputSource = source
    }
    
    @IBAction func memberButton(_ sender: UIButton) {
        highlight(button: memberButton, label: membercountLabel, source: .member)
    }
    @IBAction func acostButton(_ sender: UIButton) {
        highlight(button: acostButton, label: AcostLabel, source: .personA)
    }
    @IBAction func bcostButton(_ sender: UIButton) {
        highlight(button: bcostButton, label: BcostLabel, source: .personB)
    }
    @IBAction func ccostButton(_ sender: UIButton) {
        highlight(button: ccostButton, label: CcostLabel, source: .personC)
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
            data.roundingCost = 500
        default:break
        }
    }
    
    enum InputSource {
        case member
        case personA
        case personB
        case personC
    }
    var inputSource: InputSource = .member
    
    func buttoninput(number: String){
        switch inputSource {
        case .member:
            data.member += number
            membercountLabel.text = data.member
        case .personA:
            data.acost += number
            AcostLabel.text = data.acost
        case .personB:
            if data.member != "" && data.acost != ""{
            data.bcost += number
            BcostLabel.text = data.bcost
            }
        case .personC:
            if data.member != "" && data.acost != "" && data.bcost != ""{
            data.ccost += number
            CcostLabel.text = data.ccost
            }
        }
    }
    
    func zeroinput(number: String){
        switch inputSource {
        case .member:
            if data.member != "" && data.member != "0"{
                data.member += number
                membercountLabel.text = data.member
            }
        case .personA:
            if data.acost != "" && data.acost != "0"{
                data.acost += number
                AcostLabel.text = data.acost
            }
        case .personB:
            if data.bcost != "" && data.bcost != "0"{
                data.bcost += number
                BcostLabel.text = data.bcost
            }
        case .personC:
            if data.ccost != "" && data.ccost != "0"{
                data.ccost += number
                CcostLabel.text = data.ccost
            }
        }
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        buttoninput(number: "1")
    }
    @IBAction func twoButton(_ sender: UIButton) {
        buttoninput(number: "2")
    }
    @IBAction func threeButton(_ sender: UIButton) {
        buttoninput(number: "3")
    }
    @IBAction func fourButton(_ sender: UIButton) {
        buttoninput(number: "4")
    }
    @IBAction func fiveButton(_ sender: UIButton) {
        buttoninput(number: "5")
    }
    @IBAction func sixButton(_ sender: UIButton) {
        buttoninput(number: "6")
    }
    @IBAction func sevenButton(_ sender: UIButton) {
        buttoninput(number: "7")
    }
    @IBAction func eightButton(_ sender: UIButton) {
        buttoninput(number: "8")
    }
    @IBAction func nineButton(_ sender: UIButton) {
        buttoninput(number: "9")
    }
    @IBAction func zeroButton(_ sender: UIButton) {
        zeroinput(number: "0")
    }
    @IBAction func zerozeroButton(_ sender: UIButton) {
        zeroinput(number: "00")
    }
    
    
    func delete(Label: UILabel,data: String){
        if data != ""{
        count = Int(data.characters.count)
        endPoint = count - 1
        Label.text = data.substring(with: data.index(data.startIndex, offsetBy: 0)..<data.index(data.startIndex, offsetBy: endPoint))
        }
    }
    //一文字消すボタン
    @IBAction func AllClearButton(_ sender: UIButton) {

        switch inputSource {
        case .member:
            delete(Label: membercountLabel, data: data.member)
        case .personA:
            delete(Label: AcostLabel, data: data.acost)
        case .personB:
            delete(Label: BcostLabel, data: data.bcost)
        case .personC:
            delete(Label: CcostLabel, data: data.ccost)
        }
    }
    
    //精算ボタン
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
        
        //グラデーションの設定
        let gradientLayer = CAGradientLayer()
        //フレームを用意
        gradientLayer.frame = backgroundView.bounds
        
        //色を定義
        let color1 = UIColor(red: 0.4, green: 0.7, blue: 0.9, alpha: 1.0).cgColor as CGColor
        let color2 = UIColor(red: 0.1, green: 0.5, blue: 0.8, alpha: 1.0).cgColor as CGColor
        let color3 = UIColor.white.cgColor
        //グラデーションレイヤーに色を設定
        gradientLayer.colors = [color1, color2,color3]
        //始点・終点の設定
        gradientLayer.startPoint = CGPoint(x:0,y:0);
        gradientLayer.endPoint = CGPoint(x:1.0,y:0.8);
        //headerviewにグラデーションレイヤーを挿入
        backgroundView.layer.insertSublayer(gradientLayer,at:0)

    }
    
    //ラベルにタッチした際、枠線の色を変更
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                highlight(button: memberButton, label: membercountLabel, source: .member)
            case 2:
                highlight(button: acostButton, label: AcostLabel, source: .personA)
            case 3:
                highlight(button: bcostButton, label: BcostLabel, source: .personB)
            case 4:
                highlight(button: ccostButton, label: CcostLabel, source: .personC)
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
