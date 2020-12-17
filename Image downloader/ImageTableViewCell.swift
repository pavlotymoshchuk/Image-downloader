//
//  ImageTableViewCell.swift
//  Image downloader
//
//  Created by Павло Тимощук on 16.12.2020.
//

import UIKit
import AVFoundation
import AudioToolbox

class ImageTableViewCell: UITableViewCell, URLSessionDownloadDelegate {

    var urlSession:URLSession!
    var downloadTask:URLSessionDownloadTask!
    var resumeData:Data!
    var isDownload = false
    
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var imageDownloadButton: UIButton!
    @IBOutlet weak var percentsLabel: UILabel!
    @IBOutlet weak var imageDownloadingProgressView: UIProgressView!
    @IBOutlet weak var currentIndex: UILabel!
    

    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageImageView.image = nil
        self.imageDownloadButton.setTitle("Start downloading", for: .normal)
        self.imageDownloadButton.isUserInteractionEnabled = true
        self.percentsLabel.text = "0%"
        self.imageDownloadingProgressView.setProgress(0, animated: false)
    }
    
    @IBAction func imageDownloadButton(_ sender: UIButton) {
        if imageImageView.image == nil {
            urlSession = Foundation.URLSession.init(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
            let indexImage = Int(currentIndex.text!)!
            let currentImage = imageArray[indexImage]
            if isDownload { // Stoping downloading
                isDownload = false
                imageDownloadButton.setTitle("Start downloading", for: .normal)
                downloadTask!.cancel(byProducingResumeData: { resumeDataOrNil in
                    guard let resumeData = resumeDataOrNil else {
                      return
                    }
                    self.resumeData = resumeData
                })
            } else { // Starting or resuming downloading
                isDownload = true
                imageDownloadButton.setTitle("Stop downloading", for: .normal)
                if resumeData == nil {
                    if let url = URL(string: currentImage.url) {
                        downloadTask = urlSession.downloadTask(with: url)
                        downloadTask.resume()
                    } else {
                        alert(alertTitle: "Unable to download", alertMessage: "Your url not available", alertActionTitle: "OK")
                        self.imageDownloadButton.setTitle("Can`t download", for: .normal)
                        self.imageDownloadButton.isUserInteractionEnabled = false
                        self.percentsLabel.text = "0%"
                        self.imageDownloadingProgressView.setProgress(0, animated: false)
                    }
                } else {
                    downloadTask = urlSession.downloadTask(withResumeData: resumeData!)
                    downloadTask.resume()
                }
            }
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        if let imageData = readDownloadedData(of: location), let image = UIImage(data: imageData) {
            DispatchQueue.main.async {
                self.imageImageView.image = image
                self.imageDownloadButton.setTitle("Downloaded", for: .normal)
                self.imageDownloadButton.isUserInteractionEnabled = false
                imageArray[Int(self.currentIndex.text!)!].imageData = imageData
            }
        } else {
            alert(alertTitle: "Unable to download", alertMessage: "Your url not available", alertActionTitle: "OK")
            self.imageDownloadButton.setTitle("Can`t download", for: .normal)
            self.imageDownloadButton.isUserInteractionEnabled = false
            self.percentsLabel.text = "0%"
            self.imageDownloadingProgressView.setProgress(0, animated: false)
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let error = error else {
            return
        }
        let userInfo = (error as NSError).userInfo
        if let resumeData = userInfo[NSURLSessionDownloadTaskResumeData] as? Data {
            self.resumeData = resumeData
        }
    }
    
    // MARK: read downloaded data
    func readDownloadedData(of url: URL) -> Data? {
        do {
            let reader = try FileHandle(forReadingFrom: url)
            let data = reader.readDataToEndOfFile()
            
            return data
        } catch {
            print(error)
            return nil
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async {
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            self.percentsLabel.text = String(Int(progress*100)) + "%"
            self.imageDownloadingProgressView.setProgress(progress, animated: false)
            imageArray[Int(self.currentIndex.text!)!].percentsDownload = progress
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageImageView.contentMode = .scaleAspectFit
        self.percentsLabel.text = "0%"
        self.imageDownloadingProgressView.setProgress(0, animated: false)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func alert(alertTitle: String, alertMessage: String, alertActionTitle: String) {
        AudioServicesPlaySystemSound(SystemSoundID(4095))
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: alertActionTitle, style: .cancel) { (action) in }
        alert.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}
