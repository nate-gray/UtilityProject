//
//  TwoImageViewController.swift
//  CollageUtility
//
//  Created by Gray, Nathan on 3/16/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

import UIKit

class TwoImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var mainView: UIView!

    
    let imagePicker = UIImagePickerController()
    var imagePicked = 0
    
    //MARK: Actions
    
    @IBAction func addFirstImage(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion:nil)
        
        imagePicked = sender.tag
        
    }

    @IBAction func addSecondImage(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion:nil)
        
        imagePicked = sender.tag
        
    }
    
    @IBAction func saveCollage(_ sender: UIButton) {
        
        UIGraphicsBeginImageContextWithOptions(mainView.layer.frame.size, false, 0.0)
        mainView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let viewImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let data = UIImagePNGRepresentation(viewImage)
        let documentsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let writePath = documentsDir.appending("myimage.png")
        
        do {
            
            try data?.write(to: URL(fileURLWithPath: writePath))
            
            let alert = UIAlertController(title: "Save Collage", message: "Image Saved!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        catch {
        
            print(error)
        }
        
    }

    
    //MARK: Delegates
    
    
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if imagePicked == 1 {
            imageOne.image = pickedImage
            imageOne.contentMode = .scaleAspectFit
            dismiss(animated: true, completion: nil)
            
        }
        
        else {
            
            imageTwo.image = pickedImage
            imageTwo.contentMode = .scaleAspectFit
            dismiss(animated: true, completion: nil)
    
    }
    }
    
    func imagePickerControllerDidCancel(_ imagePicker1: UIImagePickerController, _ imagePicker2: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
