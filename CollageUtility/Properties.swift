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
    
    //MARK: User Preferences
    
    @IBOutlet weak var selectedFontStyle: UIFont!
    @IBOutlet weak var selectedFontColor: UIColor!
    @IBOutlet weak var selectedCanvasColor: UIColor!
    var reset = false // flag to determine if the canvas should be cleared. 

    
    //MARK: Actions
    
    @IBAction func arialButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "ArialMT", size: 40)
        
    }
    
    @IBAction func chalkboardButton(_ sender: UIButton) {
        
        self.selectedFontStyle = UIFont(name: "ChalkboardSE-Regular", size: 40)
        
    }
    
    @IBAction func futuraButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "Futura-Medium", size: 40)
        
    }
    
    @IBAction func helveticaButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "Helvetica", size: 40)
        
    }
    
    @IBAction func markerButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "MarkerFelt-Thin", size: 40)
        
    }
    
    @IBAction func noteworthyButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "Noteworthy-Bold", size: 40)
        
    }
    
    @IBAction func snellroundButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "SnellRoundhand", size: 40)
        
    }
    
    @IBAction func verandaButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "Verdana", size: 40)
        
    }
    
    @IBAction func zapfinoButton(_ sender: UIButton) {
        
        selectedFontStyle = UIFont(name: "Zapfino", size: 40)
        
    }
    
    @IBAction func redFont(_ sender: UIButton) {
        
        selectedFontColor = UIColor.red
        
    }
    
    @IBAction func blueFont(_ sender: UIButton) {
        
        selectedFontColor = UIColor.blue
        
    }
    
    @IBAction func greenButton(_ sender: UIButton) {
        
        selectedFontColor = UIColor.green
        
    }
    
    @IBAction func blackButton(_ sender: UIButton) {
        
        selectedFontColor = UIColor.black
        
    }
    
    @IBAction func yellowButton(_ sender: UIButton) {
        
        selectedFontColor = UIColor.yellow
        
    }
    
    @IBAction func whiteButton(_ sender: UIButton) {
        
        selectedFontColor = UIColor.white
        
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {

        self.performSegue(withIdentifier: "unwindToMain", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let main = segue.destination as! CreateCollage
        main.fontStyle = selectedFontStyle
        main.fontColor = selectedFontColor
        
        if (reset == true) {
            
            for view in main.mainView.subviews {
                
                view.removeFromSuperview()
                
            }
            
        }
        
    }
    
    @IBAction func clearCanvas(_ sender: UIButton) {
        
        let clearCanvas = UIAlertController(title: "Clear Canvas", message: "Clear the entire canvas?", preferredStyle: .alert)
        let confirmDelete = UIAlertAction(title: "Clear", style: .default) { (_) in
            self.reset = true }
        
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
