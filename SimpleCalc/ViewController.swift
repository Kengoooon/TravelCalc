//
//  ViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2016/12/22.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit

//クラス間で共有する変数を定義
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

    @IBOutlet weak var backgroundView: UIView!
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
    
    //結果画面の前に戻るボタン用
    @IBAction func back(segue:UIStoryboardSegue){
        print("back")
    }
    
    func highlight(button: UIButton, label: UILabel, inputFlag: Int) {
        bouderClear()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2;
        label.layer.borderColor = UIColor.red.cgColor
        data.inputFlag = inputFlag
    }
    
    @IBAction func costButton(_ sender: UIButton) {
        highlight(button: costButton, label: costLabel, inputFlag: 1)
    }
    @IBAction func memberButton(_ sender: UIButton) {
        highlight(button: memberButton, label: membercountLabel, inputFlag: 2)
    }
    @IBAction func afixButton(_ sender: UIButton) {
        highlight(button: afixButton, label: AfixLabel, inputFlag: 3)
    }
    @IBAction func bfixButton(_ sender: UIButton) {
       highlight(button: bfixButton, label: BfixLabel, inputFlag: 4)
    }
    @IBAction func cfixButton(_ sender: UIButton) {
        highlight(button: cfixButton, label: CfixLabel, inputFlag: 5)
    }
    
    
    //丸め単位を選択
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
    
    func buttoninput(number: String){
        switch data.inputFlag {
        case 1:
            data.cost += number
            costLabel.text = data.cost
        case 2:
            data.member += number
            membercountLabel.text = data.member
        case 3:
            data.acost += number
            AfixLabel.text = data.acost
        case 4:
            data.bcost += number
            BfixLabel.text = data.bcost
        case 5:
            data.ccost += number
            CfixLabel.text = data.ccost
        default: break
        }
    }
    
    func zeroinput(number: String){
        switch data.inputFlag {
        case 1:
            if data.cost != ""{
                data.cost += "0"
                costLabel.text = data.cost
            }
        case 2:
            if data.cost != ""{
                data.member += "0"
                membercountLabel.text = data.member
            }
        case 3:
            if data.cost != ""{
                data.acost += "0"
                AfixLabel.text = data.acost
            }
        case 4:
            if data.cost != ""{
                data.bcost += "0"
                BfixLabel.text = data.bcost
            }
        case 5:
            if data.cost != ""{
                data.ccost += "0"
                CfixLabel.text = data.ccost
            }
        default: break
        }
    }
    
    @IBAction func oneBtn(_ sender: UIButton) {
        buttoninput(number: "1")
    }
    @IBAction func twoBtn(_ sender: UIButton) {
        buttoninput(number: "2")
    }
    @IBAction func threeBtn(_ sender: UIButton) {
        buttoninput(number: "3")
    }
    @IBAction func fourBtn(_ sender: UIButton) {
        buttoninput(number: "4")
    }
    @IBAction func fiveBtn(_ sender: UIButton) {
        buttoninput(number: "5")
    }
    @IBAction func sixBtn(_ sender: UIButton) {
        buttoninput(number: "6")
    }
    @IBAction func sevenBtn(_ sender: UIButton) {
        buttoninput(number: "7")
    }
    @IBAction func eightBtn(_ sender: UIButton) {
        buttoninput(number: "8")
    }
    @IBAction func nineBtn(_ sender: UIButton) {
        buttoninput(number: "9")
    }
    @IBAction func zeroBtn(_ sender: UIButton) {
        zeroinput(number: "0")
    }
    @IBAction func zerozeroBtn(_ sender: UIButton) {
        zeroinput(number: "00")
    }
    
    func delete(Label: UILabel,data: String){
        count = Int(data.characters.count)
        endPoint = count - 1
        Label.text = data.substring(with: data.index(data.startIndex, offsetBy: 0)..<data.index(data.startIndex, offsetBy: endPoint))
    }
    
    @IBAction func backspaceButton(_ sender: UIButton) {
        switch data.inputFlag {
        case 1:
            if data.cost != ""{
                delete(Label: costLabel, data: data.cost)
            }
        case 2:
            if data.member != ""{
                delete(Label: membercountLabel, data: data.member)
            }
        case 3:
            if data.acost != ""{
                delete(Label: AfixLabel, data: data.acost)
            }
        case 4:
            if data.bcost != ""{
                delete(Label: BfixLabel, data: data.bcost)
            }
        case 5:
            if data.ccost != ""{
                delete(Label: CfixLabel, data: data.ccost)
            }
        default: break
        }
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        data.indicator = 0
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
        
        //ラベルタッチを有効化
        costLabel.isUserInteractionEnabled = true
        membercountLabel.isUserInteractionEnabled = true
        AfixLabel.isUserInteractionEnabled = true
        BfixLabel.isUserInteractionEnabled = true
        CfixLabel.isUserInteractionEnabled = true
        
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                highlight(button: costButton, label: costLabel, inputFlag: 1)
            case 2:
                highlight(button: memberButton, label: membercountLabel, inputFlag: 2)
            case 3:
                highlight(button: afixButton, label: AfixLabel, inputFlag: 3)
            case 4:
                highlight(button: bfixButton, label: BfixLabel, inputFlag: 4)
            case 5:
                highlight(button: cfixButton, label: CfixLabel, inputFlag: 5)
            default:
                break
            }
        }
    }


}

