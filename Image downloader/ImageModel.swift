//
//  ImageModel.swift
//  Image downloader
//
//  Created by Павло Тимощук on 16.12.2020.
//

import Foundation
import UIKit

struct Image {
    let url: String
    let imageName: String
    var percentsDownload: Float
    var imageData: Data?
     
    init(url: String, imageName: String) {
        self.url = url
        self.imageName = imageName
        self.percentsDownload = 0
        self.imageData = nil
    }
}

var imageArray = [
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/1.jpg", imageName: "image1"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/2.jpg", imageName: "image2"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/3.jpg", imageName: "image3"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/4.jpg", imageName: "image4"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/5.jpg", imageName: "image5"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/6.jpg", imageName: "image6"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/7.jpg", imageName: "image7"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/8.jpg", imageName: "image8"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/9.jpg", imageName: "image9"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/10.jpg", imageName: "image10"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/11.jpg", imageName: "image11"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/12.jpg", imageName: "image12"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/13.jpg", imageName: "image13"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/14.jpg", imageName: "image14"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/15.jpg", imageName: "image15"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/16.jpg", imageName: "image16"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/17.jpg", imageName: "image17"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/18.jpg", imageName: "image18"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/19.jpg", imageName: "image19"),
    Image(url: "https://pavlo-tymoshchuk-inc.right-k-left.com/images/20.jpg", imageName: "image20")
]

