//
//  ViewController.swift
//  SimpleCalc
//
//  Created by 藤本健悟 on 2016/12/22.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit
import GoogleMobileAds
//クラス間で共有する変数を定義
struct CalcData{
    var cost: String = ""
    var member: String = ""
    var acost: String = ""
    var bcost: String = ""
    var ccost: String = ""
    var acount: String = ""
    var bcount: String = ""
    var ccount: String = ""
    var indicator: Int = 0
    var paymember: Int = 0
    var percost: Int = 0
    var apayFlag: Int = 0
    var bpayFlag: Int = 0
    var cpayFlag: Int = 0
    var aname: String = ""
    var bname: String = ""
    var cname: String = ""
    var errorFlag: Int = 0
    var roundUnit: RoundUnit = .yen1
}

//丸め数を定義
enum RoundUnit {
    case yen1
    case yen10
    case yen100
    case yen500
}

class ViewController: UIViewController,GADBannerViewDelegate{
    
    //ラベル・ボタンの参照
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
    @IBOutlet weak var AmembercountLabel: UILabel!
    @IBOutlet weak var BmembercountLabel: UILabel!
    @IBOutlet weak var CmembercountLabel: UILabel!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var substractButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    
    let AdMobID = "[Your AdMob ID]"
    let TEST_ID = "ca-app-pub-6765299879929157/1239189704"
    
    var data = CalcData()
    //演算子の入力フラグ
    var opeFlag:Int = 0
    //演算子を保持する変数
    var ope:String = ""
    //合計を保持する変数
    var sum:Int64 = 0
    var result:String = "0"
    var label:UILabel?
    var max:Int64 = Int64(Int.max)
    var min:Int64 = Int64(Int.min)
    
    //結果画面の前に戻るボタン用
    @IBAction func back(segue:UIStoryboardSegue){
    }
    
    //選択したラベル・ボタンの枠線に色をつける関数
    func highlight(button: UIButton, label: UILabel, source: InputSource) {
        bouderClear()
        synchronize()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2;
        label.layer.borderColor = UIColor.red.cgColor
        inputSource = source
        opebouderClear()
        if Calculator().1.text != ""{
            sum = Int64(Calculator().1.text!)!
        }else{
            sum = 0
        }
        ope = ""
        result = ""
    }
    //選択した演算子の枠線に色をつける関数
    func opelight(button: UIButton) {
        opebouderClear()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        opeFlag = 1
    }
    
    //ボタンの処理
    @IBAction func costButton(_ sender: UIButton) {
        highlight(button: costButton, label: costLabel, source: .cost)
    }
    @IBAction func memberButton(_ sender: UIButton) {
        highlight(button: memberButton, label: membercountLabel, source: .member)
    }
    @IBAction func afixButton(_ sender: UIButton) {
        highlight(button: afixButton, label: AfixLabel, source: .personA)
    }
    @IBAction func bfixButton(_ sender: UIButton) {
       highlight(button: bfixButton, label: BfixLabel, source: .personB)
    }
    @IBAction func cfixButton(_ sender: UIButton) {
        highlight(button: cfixButton, label: CfixLabel, source: .personC)
    }
    
    //丸め単位を選択
    @IBAction func roundingSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            data.roundUnit = .yen1
        case 1:
            data.roundUnit = .yen10
        case 2:
            data.roundUnit = .yen100
        case 3:
            data.roundUnit = .yen500
        default:break
        }
    }
    
    //入力項目を定義
    enum InputSource {
        case cost
        case member
        case personA
        case personB
        case personC
        case personcountA
        case personcountB
        case personcountC
    }
    var inputSource: InputSource = .cost
    
    //数字ボタンの入力関数
    func buttoninput(number: String){
            switch inputSource {
            case .cost:
                if data.cost.characters.count < 7{
                    if opeFlag == 0{
                        data.cost += number
                        costLabel.text = data.cost
                    }else{
                        opeFlag = 0
                        data.cost = number
                        costLabel.text = data.cost
                    }
                }
            case .member:
                if data.member.characters.count < 7{
                    if opeFlag == 0{
                        data.member += number
                        membercountLabel.text = data.member
                    }else{
                        opeFlag = 0
                        data.member = number
                        membercountLabel.text = data.member
                    }
                }
            case .personA:
                if data.acost.characters.count < 7{
                    if opeFlag == 0{
                        data.acost += number
                        AfixLabel.text = data.acost
                    }else{
                        opeFlag = 0
                        data.acost = number
                        AfixLabel.text = data.acost
                    }
                }
            case .personB:
                if data.acost.characters.count < 7{
                    if opeFlag == 0{
                        data.bcost += number
                        BfixLabel.text = data.bcost
                    }else{
                        opeFlag = 0
                        data.bcost = number
                        BfixLabel.text = data.bcost
                    }
                }
            case .personC:
                if data.acost.characters.count < 7{
                    if opeFlag == 0{
                        data.ccost += number
                        CfixLabel.text = data.ccost
                    }else{
                        opeFlag = 0
                        data.ccost = number
                        CfixLabel.text = data.ccost
                    }
                }
            case .personcountA:
                if data.acount.characters.count < 4{
                     if opeFlag == 0{
                        data.acount += number
                        AmembercountLabel.text = data.acount
                     }else{
                        opeFlag = 0
                        data.acount = number
                        AmembercountLabel.text = data.acount
                    }
                }
            case .personcountB:
                if data.bcount.characters.count < 4{
                    if opeFlag == 0{
                        data.bcount += number
                        BmembercountLabel.text = data.bcount
                    }else{
                        opeFlag = 0
                        data.bcount = number
                        BmembercountLabel.text = data.bcount
                    }
                }
            case .personcountC:
                if data.ccount.characters.count < 4{
                    if opeFlag == 0{
                        data.ccount += number
                        CmembercountLabel.text = data.ccount
                    }else{
                        opeFlag = 0
                        data.ccount = number
                        CmembercountLabel.text = data.ccount
                    }
                }
        }
        opeFlag = 0
    }
    
    //"0","00"ボタンの入力関数
    func zeroinput(number: String){
        switch inputSource {
        case .cost:
            if data.cost != "" && data.cost.characters.count < 7{
                data.cost += number
                costLabel.text = data.cost
                }
        case .member:
            if data.member != "" && data.member.characters.count < 7{
                data.member += number
                membercountLabel.text = data.member
            }
        case .personA:
            if data.acost != "" && data.acost.characters.count < 7{
                data.acost += number
                AfixLabel.text = data.acost
            }
        case .personB:
            if data.bcost != "" && data.bcost.characters.count < 7{
                data.bcost += number
                BfixLabel.text = data.bcost
            }
        case .personC:
            if data.ccost != "" && data.ccost.characters.count < 7{
                data.ccost += number
                CfixLabel.text = data.ccost
            }
        case .personcountA:
            if data.acount != "" && data.acount.characters.count < 4{
                data.acount += number
                AmembercountLabel.text = data.acount
            }
        case .personcountB:
            if data.bcount != "" && data.bcount.characters.count < 4{
                data.bcount += number
                BmembercountLabel.text = data.bcount
            }
        case .personcountC:
            if data.ccount != "" && data.ccount.characters.count < 4{
                data.ccount += number
                CmembercountLabel.text = data.ccount
            }
        }
    }
    
    //数字ボタンの入力
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
    
    //計算関数１
    func Calculator() -> (String ,UILabel){
        switch inputSource {
        case .cost:
            result = data.cost
            label = costLabel
        case .member:
            result = data.member
            label = membercountLabel
        case .personA:
            result = data.acost
            label = AfixLabel
        case .personB:
            result = data.bcost
            label = BfixLabel
        case .personC:
            result = data.ccost
            label = CfixLabel
        case .personcountA:
            result = data.acount
            label = AmembercountLabel
        case .personcountB:
            result = data.bcount
            label = BmembercountLabel
        case .personcountC:
            result = data.ccount
            label = CmembercountLabel
        }
        return (result, label!)
    }

    //計算関数２
    func calc(number: String) -> String{
        if Calculator().1.text != ""{
            switch ope {
            case "+":
                sum += Int64(number)!
            case "-":
                sum -= Int64(number)!
            case "×":
                sum *= Int64(number)!
            case "":
                sum = Int64(number)!
            default: break
            }
        }
        
        if sum > max{
            sum = max
        }else if sum < min{
            sum = min
        }
        return String(sum)
    }

    //足し算
    @IBAction func additionButton(_ sender: UIButton) {
        if opeFlag == 0{
            Calculator().1.text = calc(number: (Calculator().0))
            ope = "+"
            opelight(button: additionButton)
        }else if opeFlag == 1{
            ope = "+"
            opelight(button: additionButton)
        }
    }
    //引き算
    @IBAction func substractButton(_ sender: UIButton) {
        if opeFlag == 0{
            Calculator().1.text = String(calc(number: (Calculator().0)))
            ope = "-"
            opelight(button: substractButton)
        }else if opeFlag == 1{
            ope = "-"
            opelight(button: substractButton)
        }
    }
    //掛け算
    @IBAction func multiplicationButton(_ sender: UIButton) {
        if opeFlag == 0{
            Calculator().1.text = String(calc(number: (Calculator().0)))
            ope = "×"
            opelight(button: multiplicationButton)
        }else if opeFlag == 1{
            ope = "×"
            opelight(button: multiplicationButton)
        }
    }
    @IBAction func equalButton(_ sender: UIButton) {
        if ope != ""{
        Calculator().1.text = calc(number: (Calculator().0))
        opeFlag = 1
        opebouderClear()
        }
    }
    
    //ACボタン
    @IBAction func backspaceButton(_ sender: UIButton) {
        switch inputSource {
        case .cost:
            if data.cost != ""{
                data.cost = ""
                costLabel.text = data.cost
                clear()
            }
        case .member:
            if data.member != ""{
                data.member = ""
                membercountLabel.text = data.member
                clear()
            }
        case .personA:
            if data.acost != ""{
                data.acost = ""
                AfixLabel.text = data.acost
                clear()
            }
        case .personB:
            if data.bcost != ""{
                data.bcost = ""
                BfixLabel.text = data.bcost
                clear()
            }
        case .personC:
            if data.ccost != ""{
                data.ccost = ""
                CfixLabel.text = data.ccost
                clear()
            }
        case .personcountA:
            if data.acount != ""{
                data.acount = ""
                AmembercountLabel.text = data.acount
                clear()
            }
        case .personcountB:
            if data.bcount != ""{
                data.bcount = ""
                BmembercountLabel.text = data.bcount
                clear()
            }
        case .personcountC:
            if data.ccount != ""{
                data.ccount = ""
                CmembercountLabel.text = data.ccount
                clear()
            }
        }
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        performSegue(withIdentifier: "PushResult", sender: resultButton)
        data.indicator = 0
    }

    //TOP画面に戻るボタン
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //枠線の色を元に戻す関数
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
        AmembercountLabel.layer.borderColor = UIColor.black.cgColor
        BmembercountLabel.layer.borderColor = UIColor.black.cgColor
        CmembercountLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    //ラベルとstruckの値を同期する関数
    func synchronize() -> (){
        data.cost = costLabel.text!
        data.member = membercountLabel.text!
        data.acost = AfixLabel.text!
        data.bcost = BfixLabel.text!
        data.ccost = CfixLabel.text!
        data.acount = AmembercountLabel.text!
        data.bcount = BmembercountLabel.text!
        data.ccount = CmembercountLabel.text!
    }
    
    //演算子の枠線の色を元に戻す関数
    func opebouderClear() -> (){
        additionButton.layer.borderWidth = 0.5
        additionButton.layer.borderColor = UIColor.black.cgColor
        substractButton.layer.borderWidth = 0.5
        substractButton.layer.borderColor = UIColor.black.cgColor
        multiplicationButton.layer.borderWidth = 0.5
        multiplicationButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func clear() -> (){
        opebouderClear()
        ope = ""
        opeFlag = 0
        sum = 0
        result = ""
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
        AmembercountLabel.isUserInteractionEnabled = true
        BmembercountLabel.isUserInteractionEnabled = true
        CmembercountLabel.isUserInteractionEnabled = true
        
        // AdMob広告設定
        var bannerView: GADBannerView = GADBannerView()
        bannerView = GADBannerView(adSize:kGADAdSizeBanner)
        bannerView.frame.origin = CGPoint(x:0, y:(self.view.frame.size.height - bannerView.frame.height))
        bannerView.frame.size = CGSize(width:self.view.frame.width,height:bannerView.frame.height)
        // AdMobで発行された広告ユニットIDを設定
        bannerView.adUnitID = "ca-app-pub-6765299879929157/1239189704"
        bannerView.delegate = self
        bannerView.rootViewController = self
        let gadRequest:GADRequest = GADRequest()
        // テスト用の広告を表示する時のみ使用（申請時に削除）
        gadRequest.testDevices = [kGADSimulatorID]
        bannerView.load(gadRequest)
        self.view.addSubview(bannerView)
        
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
    
    //ラベルタッチ時の動作
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                highlight(button: costButton, label: costLabel, source: .cost)
            case 2:
                highlight(button: memberButton, label: membercountLabel, source: .member)
            case 3:
                highlight(button: afixButton, label: AfixLabel, source: .personA)
            case 4:
                highlight(button: bfixButton, label: BfixLabel, source: .personB)
            case 5:
                highlight(button: cfixButton, label: CfixLabel, source: .personC)
            case 6:
                highlight(button: afixButton, label: AmembercountLabel, source: .personcountA)
            case 7:
                highlight(button: bfixButton, label: BmembercountLabel, source: .personcountB)
            case 8:
                highlight(button: cfixButton, label: CmembercountLabel, source: .personcountC)
            default:
                break
            }
        }
    }


}

