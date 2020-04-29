//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 0002 QBS on 2020/04/22.
//  Copyright © 2020 0002 QBS. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    //@IBOutlet weak var ViweIMG: UIImageView!
    
    @IBOutlet weak var ImageButtom: UIButton!
    
    // 画像切り替え用変数
    var imageNumber = 0
    // タイマー
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // 画像表示用配列
    let imageNameArray = ["IMG_1","IMG_2","IMG_3",
                          "IMG_4","IMG_5","IMG_6"]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayImage()
    }
    // 進むボタン処理
    @IBAction func NextButtom(_ sender: Any)
    {
        if self.timer == nil
        {
            if (imageNumber != 5)
            {
                imageNumber  += 1
            }
            else
            {
                imageNumber = 0
            }
            displayImage()
        }
    }
    // 戻るボタン処理
    @IBAction func BackButtom(_ sender: Any)
    {
        if self.timer == nil
        {

            if (imageNumber != 0)
            {
                imageNumber  -= 1
            }
            else
            {
                imageNumber = 5
            }
            displayImage()
        }
    }
    // 再生停止ボタン
    @IBAction func ActionButtom(_ sender: Any)
    {
        // timerが存在しない時再生処理を行う
        if self.timer == nil
        {
            startTimer()
        }
        // timerが存在する時は停止処理を行う
       else if self.timer != nil
        {
            stopTimer()
        }
    }
    
    //再生ボタン処理
    func startTimer()
    {
        //2秒後毎にupdateTimerを呼び出す
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    // 停止ボタン処理
    func stopTimer()
    {
        self.timer.invalidate()   // タイマーを停止する
        self.timer = nil

    }
    
    @IBAction func ImageButtom(_ sender: Any)
    {
        
        if self.timer != nil
        {
            stopTimer()
        }
    }
    
    // 2秒カウント処理
    @objc func updateTimer(_ timer: Timer)
    {
        if (imageNumber != 5)
        {
            imageNumber  += 1
        }
        else
        {
            imageNumber = 0
        }
        
        displayImage()
    }

    // 画像呼び出し処理
    func displayImage ()
    {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[imageNumber]
        // 画像を読み込み
        let image = UIImage(named: name)
        
        self.ImageButtom.setImage(image, for: .normal)
    }
    
    //画像番号の受け渡し処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // segueから遷移先のResultViewControllerを取得する
         let upimageViewController:UpimageViewController = segue.destination as! UpimageViewController
        
         upimageViewController.upimageNumber = imageNumber
     }
    
    // 戻る画面遷移処理
    @IBAction func unwind(_ segue: UIStoryboardSegue)
    {
         
    }
    
}

