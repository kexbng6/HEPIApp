//
//  PlanningViewController.swift
//  HEPIApp
//
//  Created by Kevin Bonga on 06.05.21.
//  Copyright © 2021 Kevin Bonga. All rights reserved.
//

import UIKit
import Photos
import FirebaseStorage
import Firebase

class PlanningViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.horaireImageView.image = image
            }
        })
        task.resume()
    }
    
    @IBOutlet weak var horaireImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    

    // let imagePicker = UIImagePickerController()


    
    /*func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        guard let imageData = image.pngData() else {return}
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }*/
    
    
    @IBAction func activatePhotoLib(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            horaireImageView.image = image
            uploadImagePic(img1: image)
        }
        picker.dismiss(animated: true, completion: nil);
    }

    func uploadImagePic(img1: UIImage){
        let storage = Storage.storage().reference()

        var data = NSData()
        data = UIImageJPEGRepresentation(img1, 0.8)! as NSData
        let filePath = "images/file.jpeg"
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storage.child(filePath).putData(data as Data, metadata: metaData){(metaData, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                storage.child(filePath).downloadURL {(url, error) in
                    guard let downloadURL = url else {
                        return
                    }
                    let urlString = url?.absoluteString
                    print("Download URL: \(urlString)")
                    UserDefaults.standard.set(urlString, forKey: "url")
                }
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
