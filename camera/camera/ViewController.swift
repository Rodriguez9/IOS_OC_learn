//
//  ViewController.swift
//  camera
//
//  Created by YZH on 2017/12/17.
//  Copyright © 2017年 YZH. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController,UIImagePickerControllerDelegate,
                                        UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var takePictureButton: UIButton!
    var avPlayerViewController:AVPlayerViewController!
    var image:UIImage?
    var movieURL:URL?
    var choose:String?
    @IBAction func shootpictureorlibrary(_ sender: UIButton) {
        pickMediaFromSource(sourceType: .camera)
    }
    @IBAction func selectexistingpictureorvideo(_ sender: UIButton) {
        pickMediaFromSource(sourceType: .photoLibrary)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            takePictureButton.isHidden=true
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateDisplay()
    }
    
    func updateDisplay(){
        if let mediaType=choose{
            if mediaType==kUTTypeImage as String{
                imageView.image=image!
                imageView.isHidden=false
                if avPlayerViewController != nil{
                    avPlayerViewController!.view.isHidden=true
                }
            }//else if mediaType==kUTTypeMovie
        }
    }

    func pickMediaFromSource(sourceType:UIImagePickerControllerSourceType){
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType)!
        if UIImagePickerController.isSourceTypeAvailable(sourceType) && mediaTypes.count>0 {
            let  picker = UIImagePickerController()
            picker.mediaTypes=mediaTypes
            picker.delegate=self
            picker.allowsEditing=true
            picker.sourceType=sourceType
            present(picker,animated: true,completion: nil)
        }
        else{
            let alertCOntroller = UIAlertController(title:"ERROR",message:"Unsupported",preferredStyle:UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.cancel,handler:nil)
            alertCOntroller.addAction(okAction)
            present(alertCOntroller,animated: true,completion: nil)
    
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        choose=info[UIImagePickerControllerMediaType] as! String
        if let mediaType = choose{
            if mediaType==kUTTypeImage as String{
                image=info[UIImagePickerControllerEditedImage] as! UIImage
            }
            else if mediaType == kUTTypeMovie as String{
                movieURL = info[UIImagePickerControllerMediaType] as! URL
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

