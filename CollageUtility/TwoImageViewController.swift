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
    
    @IBOutlet weak var twoImagePlaceholder: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    //MARK: Actions
    
    @IBAction func addFirstImage(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion:nil)
        
    }
    
    
    @IBAction func addSecondImage(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion:nil)
        
    }
    
    //MARK: Delegates
    
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        twoImagePlaceholder.contentMode = .scaleAspectFit
        twoImagePlaceholder.image = chosenImage
        dismiss(animated: true, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(_ imagePicker: UIImagePickerController) {
        
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
