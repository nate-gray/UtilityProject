//
//  TwoImageViewController.swift
//  CollageUtility
//
//  Created by Gray, Nathan on 3/16/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

import UIKit

class CreateCollage: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
    }
    
    //MARK: Property values
    
//    @IBOutlet weak var fontStyle: UIFont!
//    @IBOutlet weak var fontColor: UIColor!
//    @IBOutlet weak var canvasColor: UIColor!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Unwind from properties
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
        if (GlobalVariables.sharedManager.canvasChanged == false) {
            
            mainView.backgroundColor = GlobalVariables.sharedManager.previousCanvasColor
            
        }
        
        else {
            
            mainView.backgroundColor = GlobalVariables.sharedManager.newCanvasColor
        }
        
        if(GlobalVariables.sharedManager.resetCanvas == true) {
            
            for view in mainView.subviews {
                
                view.removeFromSuperview()
                
            }
            
        }
        
        
    }
    
    //MARK: Outlets
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var createAnotherOutlet: UIButton!
    
    
    //MARK: Create Image Picker Controller
    
    let imagePicker = UIImagePickerController()

    //MARK: Handlers
    
    func handleTap(_ recognizer:UITapGestureRecognizer) {
        
        let object = recognizer.view as? AnyObject
        tapAction(sender: object!)
        
    }
    
    func handlePan(_ recognizer:UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    func handlePinch(_ recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    func handleRotate(_ recognizer : UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    //MARK: Actions
    
    
    @IBAction func tapAction(sender: AnyObject) {
        
        let deleteAlert = UIAlertController(title: "Delete", message: "Remove from canvas", preferredStyle: .alert)
        let confirmDelete = UIAlertAction(title: "Delete", style: .default) { (_) in
            sender.removeFromSuperview() }
        
        let cancelDelete = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        deleteAlert.addAction(confirmDelete)
        deleteAlert.addAction(cancelDelete)
        
        self.present(deleteAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func longPressAction(sender: AnyObject) {

        GlobalVariables.sharedManager.previousCanvasColor = mainView.backgroundColor
        performSegue(withIdentifier: "goToProperties", sender: AnyObject.self)
    
    }

    @IBAction func addText(_ sender: UIButton) {
        
        // Create an alert to prompt for message
        
        let alertController = UIAlertController(title: "Message", message: "Enter your message", preferredStyle: .alert)
        
        // Create the text field in the alert
        
        alertController.addTextField { (textField) in textField.text = ""
        }
        
        // If text is entered, when selecting dont create a label
        let confirmText = UIAlertAction(title: "Done", style: .default) { (_) in
            if let field = alertController.textFields![0] as? UITextField {
               
                var label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50)) // Create a label
                label.text = field.text //Set the text of the label to text entered in alert
                label.font = GlobalVariables.sharedManager.fontStyle
                label.textColor = GlobalVariables.sharedManager.fontColor
                label.sizeToFit() // Resize the label to fit the string
                label.isUserInteractionEnabled = true //Allow for gestures on the label
                
                self.mainView.addSubview(label) //Add to the main view
                
                // Add gestures to the label
                
                let pinch = UIPinchGestureRecognizer(target: self, action: #selector(CreateCollage.handlePinch(_:)))
                label.addGestureRecognizer(pinch)
                
                let pan = UIPanGestureRecognizer(target: self, action: #selector(CreateCollage.handlePan(_:)))
                label.addGestureRecognizer(pan)
                
                let rotate = UIRotationGestureRecognizer(target: self, action: #selector(CreateCollage.handleRotate(_:)))
                label.addGestureRecognizer(rotate)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(CreateCollage.handleTap(_:)))
                label.addGestureRecognizer(tap)
                
            } else {
                
            }
        }
        
        let cancelText = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addAction(cancelText)
        alertController.addAction(confirmText)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion:nil)
        
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        
        UIGraphicsBeginImageContextWithOptions(mainView.layer.frame.size, false, 0.0)
        mainView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imageCanvas = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // Show the apple share UI
        
        let appleShare = UIActivityViewController(activityItems: [imageCanvas], applicationActivities: [])
        present(appleShare, animated: true, completion: nil)
        
    }
    

    //MARK: Launch image picker, add image to the canvas, and implement gestures to the image
    
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
        
        let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage //selected image from picker
        
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))  //create a new UIImageView frame for selected picker
        imageview.image = pickedImage  //place the selected image in the new view
        imageview.contentMode = .scaleAspectFit //scale the image
        self.mainView.addSubview(imageview) //add the new view to the main view
        dismiss(animated: true, completion: nil) // close the image picker
        
        //Add Gestures to the UIImageVIew
        imageview.isUserInteractionEnabled = true
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(CreateCollage.handlePinch(_:)))
        imageview.addGestureRecognizer(pinch)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(CreateCollage.handlePan(_:)))
        imageview.addGestureRecognizer(pan)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(CreateCollage.handleRotate(_:)))
        imageview.addGestureRecognizer(rotate)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateCollage.handleTap(_:)))
        imageview.addGestureRecognizer(tap)
        
    }
    
    // If the image picker is canceled, close the picker
    
    func imagePickerControllerDidCancel(_ imagePicker1: UIImagePickerController, _ imagePicker2: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
    }
}
