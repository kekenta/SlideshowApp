//
//  UpimageViewController.swift
//  SlideshowApp
//
//  Created by 0002 QBS on 2020/04/22.
//  Copyright © 2020 0002 QBS. All rights reserved.
//

import UIKit

class UpimageViewController: UIViewController
{
    @IBOutlet weak var Upimage: UIImageView!
    // 画像切り替え用変数
    var upimageNumber = 0
    // 画像表示用配列
    let imageNameArray = ["IMG_1","IMG_2","IMG_3",
                           "IMG_4","IMG_5","IMG_6"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    // 画面が表示されるたた度に画像設定
    override func viewDidLayoutSubviews()
    {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[upimageNumber]
        // 画像を読み込み
        let image = UIImage(named: name)!
        Upimage.image = image
     
    }
}
