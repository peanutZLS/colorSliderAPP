//
//  ViewController.swift
//  colorSlider
//
//  Created by 郭家宇 on 2023/7/2.
//

import UIKit

class ViewController: UIViewController {
    // RGB 色彩值
    var redValue = 255
    var greenValue = 255
    var blueValue = 255

    // Hex 色彩值
    var redhex = "ff"
    var greenhex = "ff"
    var bluehex = "FF"
    
    // 連接介面元件
    @IBOutlet weak var colorView: UIView! // 顯示目前顏色的視圖
    @IBOutlet weak var rgbLabel: UILabel! // 顯示 RGB 色彩值的標籤
    @IBOutlet weak var hexLabel: UILabel! // 顯示 Hex 色彩值的標籤
    @IBOutlet weak var redSlider: UISlider! // 紅色色彩分量的滑桿
    @IBOutlet weak var greenSlider: UISlider! // 綠色色彩分量的滑桿
    @IBOutlet weak var blueSlider: UISlider! // 藍色色彩分量的滑桿
    @IBOutlet weak var randomButton: UIButton! // 產生隨機顏色的按鈕
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 在視圖載入後進行任何額外的設置
    }

    // 當紅色滑桿的值改變時執行的動作
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = Int(sender.value)
        redhex = Int2strHex(int: Int(sender.value))
        whenColorChanged()
    }
    
    // 當綠色滑桿的值改變時執行的動作
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = Int(sender.value)
        greenhex = Int2strHex(int: Int(sender.value))
        whenColorChanged()
    }
    
    // 當藍色滑桿的值改變時執行的動作
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueValue = Int(sender.value)
        bluehex = Int2strHex(int: Int(sender.value))
        whenColorChanged()
    }

    // 處理顏色變化的函式
    func whenColorChanged() {
        // 使用新的 RGB 值更新顏色視圖
        colorView.backgroundColor = UIColor(
            red: CGFloat(redValue) / 255,
            green: CGFloat(greenValue) / 255,
            blue: CGFloat(blueValue) / 255,
            alpha: 1
        )
        
        // 使用新值更新 RGB 和 Hex 標籤
        rgbLabel.text = "當前色碼RGB：    \(redValue),\(greenValue),\(blueValue)"
        hexLabel.text = "當前色碼16進制：  #\(redhex)\(greenhex)\(bluehex)"
        
        // 根據顏色值判斷是否將標籤文字顏色設為黑色或白色
        if redValue <= 150 && greenValue <= 150 && blueValue <= 150 {
            rgbLabel.textColor = .white
            hexLabel.textColor = .white
        } else {
            rgbLabel.textColor = .black
            hexLabel.textColor = .black
        }
        
        // 更新滑桿的值為新的色彩分量值
        redSlider.value = Float(redValue)
        greenSlider.value = Float(greenValue)
        blueSlider.value = Float(blueValue)
    }
    
    // 整數轉換為十六進制字串的函式
    func Int2strHex(int: Int) -> String {
        let str = String(int, radix: 16)
        return str
    }
    
    // 點擊隨機顏色按鈕時執行的動作
    @IBAction func randomColorButton(_ sender: UIButton) {
        // 生成隨機的 RGB 色彩值
        redValue = Int.random(in: 0...255)
        redhex =  Int2strHex(int: Int(redValue))
        greenValue = Int.random(in: 0...255)
        greenhex =  Int2strHex(int: Int(greenValue))
        blueValue = Int.random(in: 0...255)
        bluehex =  Int2strHex(int: Int(blueValue))

        // 更新顏色視圖和標籤
        whenColorChanged()
    }
}
