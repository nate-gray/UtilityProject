//
//  TwoCreateViewController.swift
//  CollageUtility
//
//  Created by Gray, Nathan on 3/18/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

import UIKit

class TwoCreateViewController: UIViewController {

    @IBOutlet weak var imageOneSave: UIImageView!
    @IBOutlet weak var imageTwoSave: UIImageView!
    
    var image1: UIImage!
    var image2: UIImage!
    
    override func viewDidLoad() {
        imageOneSave.image = image1
        imageTwoSave.image = image2
        super.viewDidLoad()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
