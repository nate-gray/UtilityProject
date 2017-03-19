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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Outlets
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var createAnotherOutlet: UIButton!
    
    //MARK: Create Image Picker Controller
    
    let imagePicker = UIImagePickerController()
    
    //MARK: Gesture Handlers
    
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
    
    @IBAction func addImage(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion:nil)
        
    }
    
    
    
    
//    @IBAction func saveCollage(_ sender: UIButton) {
//        
//        UIGraphicsBeginImageContextWithOptions(mainView.layer.frame.size, false, 0.0)
//        mainView.layer.render(in: UIGraphicsGetCurrentContext()!)
//        let viewImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        
//        // Show the apple share UI
//        
//        let appleShare = UIActivityViewController(activityItems: [viewImage], applicationActivities: [])
//        present(appleShare, animated: true, completion: nil)
//        
//        
//        // Show the create another button to go back to the home screen
//        
//        createAnotherOutlet.isHidden = false
//        
//    }

    
//    @IBAction func createAnother(_ sender: UIButton) {
//        
//        self.performSegue(withIdentifier: "unwindToMainView", sender: self)
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Save Image" {
            
            let dvc = segue.destination as! SaveCollage
//            dvc.image1 = imageOne.image
//            dvc.image2 = imageTwo.image

        }
        
    }
    

    //MARK: Launch image picker, add image to the canvas, and implement gestures to the image
    
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
        
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage //selected image from picker
        
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))  //create a new UIImageView frame for selected picker
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
        
        
    }
    
    // If the image picker is canceled, close the picker
    
    func imagePickerControllerDidCancel(_ imagePicker1: UIImagePickerController, _ imagePicker2: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
    }
}
