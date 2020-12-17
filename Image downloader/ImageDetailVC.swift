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
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImageView?.image = image
        fullImageView?.contentMode = .scaleAspectFit
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveToGalleryButton(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
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
