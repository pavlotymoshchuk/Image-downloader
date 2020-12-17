//
//  ViewController.swift
//  Image downloader
//
//  Created by Павло Тимощук on 16.12.2020.
//

import UIKit

class ImagesTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imagesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesTableView?.rowHeight = 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
            let currentImage = imageArray[indexPath.row]
            if let imageData = currentImage.imageData {
                cell.imageImageView.image = UIImage(data: imageData)
            } else {
                cell.imageImageView.image = nil
            }
            if currentImage.percentsDownload != 1 {
                cell.imageDownloadButton.setTitle("Start downloading", for: .normal)
            } else {
                cell.imageDownloadButton.setTitle("Downloaded", for: .normal)
            }
            cell.percentsLabel.text = String(Int(currentImage.percentsDownload*100)) + "%"
            cell.imageDownloadingProgressView.setProgress(currentImage.percentsDownload, animated: false)
            cell.currentIndex.text = String(indexPath.row)
            cell.imageNameLabel?.text = imageArray[indexPath.row].imageName
            cell.imageImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDetail)))
            cell.imageImageView.isUserInteractionEnabled = true
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func showDetail(_ sender:UITapGestureRecognizer) {
        var pointValue = CGPoint()
        pointValue = sender.location(in: imagesTableView)
        var indexPath = IndexPath()
        indexPath = imagesTableView.indexPathForRow(at: pointValue)!
        print(indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ImageDetailVC") as? ImageDetailVC {
            vc.modalPresentationStyle = .popover
            vc.modalTransitionStyle = .crossDissolve
            if let imageData = imageArray[indexPath.row].imageData, let image = UIImage(data: imageData) {
                vc.image = image
                UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
            }
        }
    }
    
}

