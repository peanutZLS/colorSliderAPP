# colorSliderAPP
Use the slider control to change the RBG color

這是成品實現：

<div align = "center">
<img src="https://github.com/peanutZLS/colorSliderAPP/assets/139115922/03b5d041-e56b-4a16-86e5-a75ca913fde2" alt="pic" width="300" height="600" />
</div>

# Storyboard
上半部為顯色區，下半部為操作區。

* 顯色區塊View
  
    ```swift
    @IBOutlet weak var colorView: UIView! // 顯示目前顏色的視圖
    ```
    
* 色碼訊息Label
  
    ```swift
    @IBOutlet weak var rgbLabel: UILabel! // 顯示 RGB 色彩值的標籤
    @IBOutlet weak var hexLabel: UILabel! // 顯示 Hex 色彩值的標籤
    ```
* 操作Slider及隨機Button
  
    ```swift
    @IBOutlet weak var redSlider: UISlider! // 紅色色彩分量的滑桿
    @IBOutlet weak var greenSlider: UISlider! // 綠色色彩分量的滑桿
    @IBOutlet weak var blueSlider: UISlider! // 藍色色彩分量的滑桿
    @IBOutlet weak var randomButton: UIButton! // 產生隨機顏色的按鈕
    ```
---

* 首先要先攥寫滑桿動作
 ```swift
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
 ```
* 再來攥寫當顏色變更後的function
 ```swift
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
        hexLabel.text = "當前色碼16進制：#\(redhex)\(greenhex)\(bluehex)"
        
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
 ```
 * 因為我有要顯示16進位的色碼，這裡把int轉為16進制
 ```swift
      // 整數轉換為十六進制字串的函式
    func Int2strHex(int: Int) -> String {
        let str = String(int, radix: 16)
        return str
    }
 ```
* 製作random亂數產生顏色
 ```swift
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
 ```
