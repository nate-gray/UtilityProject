//
//  Properties.swift
//  CollageUtility
//
//  Created by Gray, Nathan on 3/19/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

import UIKit

class Properties: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GlobalVariables.sharedManager.canvasChanged = false
        GlobalVariables.sharedManager.resetCanvas = false
        canvasColorPreview.backgroundColor = GlobalVariables.sharedManager.canvasColor
        
        if (GlobalVariables.sharedManager.fontStyle == nil) {
            
            fontPreview.font = UIFont(name: "ArialMT", size: 40)
            
        } else {
            
            fontPreview.font = GlobalVariables.sharedManager.fontStyle
            
        }
        
        if (GlobalVariables.sharedManager.fontColor == nil) {
            
            fontPreview.textColor = UIColor.black
            
        } else {
            
            fontPreview.textColor = GlobalVariables.sharedManager.fontColor
            
        }
        
        
        
        if (GlobalVariables.sharedManager.redSlider == nil) {
            
            redSliderValue.value = 0.5
            
        } else {
            
            redSliderValue.value = GlobalVariables.sharedManager.redSlider
            
        }
        
        if (GlobalVariables.sharedManager.blueSlider == nil) {
            
            blueSliderValue.value = 0.5
            
        } else {
            
            blueSliderValue.value = GlobalVariables.sharedManager.blueSlider
            
        }
        
        
        if (GlobalVariables.sharedManager.greenSlider == nil) {
            
            greenSliderValue.value = 0.5
            
        } else {
            
            greenSliderValue.value = GlobalVariables.sharedManager.greenSlider
            
        }
        
        if (GlobalVariables.sharedManager.alphaSlider == nil) {
            
            alphaSliderValue.value = 0.5
            
        } else {
            
            alphaSliderValue.value = GlobalVariables.sharedManager.alphaSlider
            
        }

        // Add borders to all of the colors
        
        redButtonOutlet.layer.borderWidth = 1
        redButtonOutlet.layer.borderColor = UIColor.black.cgColor
        blueButtonOutlet.layer.borderWidth = 1
        blueButtonOutlet.layer.borderColor = UIColor.black.cgColor
        greenButtonOutlet.layer.borderWidth = 1
        greenButtonOutlet.layer.borderColor = UIColor.black.cgColor
        blackButtonOutlet.layer.borderWidth = 1
        blackButtonOutlet.layer.borderColor = UIColor.black.cgColor
        yellowButtonOutlet.layer.borderWidth = 1
        yellowButtonOutlet.layer.borderColor = UIColor.black.cgColor
        whiteButtonOutlet.layer.borderWidth = 1
        whiteButtonOutlet.layer.borderColor = UIColor.black.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Actions
    
    @IBAction func arialButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "ArialMT", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func chalkboardButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "ChalkboardSE-Regular", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func futuraButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "Futura-Medium", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func helveticaButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "Helvetica", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func markerButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "MarkerFelt-Thin", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func noteworthyButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "Noteworthy-Bold", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func snellroundButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "SnellRoundhand", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func verandaButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "Verdana", size: 40)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func zapfinoButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontStyle = UIFont(name: "Zapfino", size: 30)
        fontPreview.font = GlobalVariables.sharedManager.fontStyle
        
    }
    
    @IBAction func redFont(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontColor = UIColor.red
        fontPreview.textColor = GlobalVariables.sharedManager.fontColor
        
    }
    
    @IBAction func blueFont(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontColor = UIColor.blue
        fontPreview.textColor = GlobalVariables.sharedManager.fontColor
        
    }
    
    @IBAction func greenButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontColor = UIColor.green
        fontPreview.textColor = GlobalVariables.sharedManager.fontColor
        
    }
    
    @IBAction func blackButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontColor = UIColor.black
        fontPreview.textColor = GlobalVariables.sharedManager.fontColor
        
    }
    
    @IBAction func yellowButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontColor = UIColor.yellow
        fontPreview.textColor = GlobalVariables.sharedManager.fontColor
        
    }
    
    @IBAction func whiteButton(_ sender: UIButton) {
        
        GlobalVariables.sharedManager.fontColor = UIColor.white
        fontPreview.textColor = GlobalVariables.sharedManager.fontColor
        
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {

        self.performSegue(withIdentifier: "unwindToMain", sender: self)
        
    }
    
    @IBAction func clearCanvas(_ sender: UIButton) {
        
        let clearCanvas = UIAlertController(title: "Clear Canvas", message: "Clear the entire canvas?", preferredStyle: .alert)
        let confirmDelete = UIAlertAction(title: "Clear", style: .default) { (_) in
            GlobalVariables.sharedManager.resetCanvas = true }
        
        let cancelDelete = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        clearCanvas.addAction(confirmDelete)
        clearCanvas.addAction(cancelDelete)
        
        self.present(clearCanvas, animated: true, completion: nil)

        
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {

        GlobalVariables.sharedManager.canvasChanged = true
        
        var color = UIColor(
            red: CGFloat(redSliderValue.value),
            green: CGFloat(greenSliderValue.value),
            blue: CGFloat(blueSliderValue.value),
            alpha: CGFloat(alphaSliderValue.value))
        
        GlobalVariables.sharedManager.redSlider = redSliderValue.value
        GlobalVariables.sharedManager.blueSlider = blueSliderValue.value
        GlobalVariables.sharedManager.greenSlider = greenSliderValue.value
        GlobalVariables.sharedManager.alphaSlider = alphaSliderValue.value
        
        canvasColorPreview.backgroundColor = color
        GlobalVariables.sharedManager.newCanvasColor = color
        
    }
    
    //MARK: Outlets
    
    @IBOutlet weak var fontPreview: UILabel!
    
    @IBOutlet weak var canvasColorPreview: UIImageView!
    
    @IBOutlet weak var redButtonOutlet: UIButton!
    
    @IBOutlet weak var blueButtonOutlet: UIButton!
    
    @IBOutlet weak var greenButtonOutlet: UIButton!

    @IBOutlet weak var blackButtonOutlet: UIButton!
    
    @IBOutlet weak var yellowButtonOutlet: UIButton!

    @IBOutlet weak var whiteButtonOutlet: UIButton!
    
    @IBOutlet weak var redSliderValue: UISlider!
    
    @IBOutlet weak var greenSliderValue: UISlider!
    
    @IBOutlet weak var blueSliderValue: UISlider!
    
    @IBOutlet weak var alphaSliderValue: UISlider!
    
}
