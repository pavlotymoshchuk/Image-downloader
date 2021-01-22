//
//  ImageDetailVC.swift
//  Image downloader
//
//  Created by Павло Тимощук on 16.12.2020.
//

import UIKit
import Photos
import AVFoundation
import AudioToolbox

class ImageDetailVC: UIViewController {
    
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var imageName: UILabel!
    
    var image = (UIImage(),String())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImageView?.image = image.0
        imageName.text = image.1
        fullImageView?.contentMode = .scaleAspectFit
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveToGalleryButton(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(image.0, self, nil, nil)
        alert(alertTitle: "Image saved", alertMessage: "Image was saved to photo library", alertActionTitle: "OK")
    }
    
    func alert(alertTitle: String, alertMessage: String, alertActionTitle: String) {
        AudioServicesPlaySystemSound(SystemSoundID(4095))
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: alertActionTitle, style: .cancel) { (action) in }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
