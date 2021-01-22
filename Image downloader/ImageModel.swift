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
    Image(url: "https://i.pinimg.com/originals/d4/18/62/d41862da95ed8191b855f9085accdb91.jpg?epik=dj0yJnU9azlIOGpEaEMwZVpHRktVY2l3aXBOeFJqMXluVHdYOTcmcD0wJm49TGUtR241RU5WcUM2UUx0LVhuTnFKdyZ0PUFBQUFBR0FLMENJ", imageName: "Evening city"),
    Image(url: "https://i.pinimg.com/originals/58/d2/09/58d2094dde425eb51a367ca8e001f715.jpg?epik=dj0yJnU9NUhSQXA5MGFiX1Nyd00zbUowY2RQWWZHWlR0eG1QR28mcD0wJm49VHhsN0dIZnJ4bVVxZnZTSWY0cFZvdyZ0PUFBQUFBR0FLMEp3", imageName: "Snowy park"),
    Image(url: "https://i.pinimg.com/originals/87/0a/9e/870a9ea6682a0ed030b90f79e6629390.jpg", imageName: "Dew on the lawn"),
    Image(url: "https://i.pinimg.com/originals/62/41/2b/62412b51ac7eb73560f4d60cd071924f.jpg?epik=dj0yJnU9QmZ4Ymc3eVM5d2J3STFRSk40dUNJZ2VrT0QtQVR4S3gmcD0wJm49d2ZiYmFjc3ZvN25NZ1d5Y3JEUW9EUSZ0PUFBQUFBR0FLMFRZ", imageName: "Mountain peaks"),
    Image(url: "https://i.pinimg.com/originals/5a/e2/e5/5ae2e5c3a269225ba5f1d63b246c76f5.jpg", imageName: "Lightning at night"),
    Image(url: "https://i.pinimg.com/originals/42/fa/b2/42fab23574c754a6be4ff7a8b2e2cecf.jpg", imageName: "Starry night in the mountains"),
    Image(url: "https://i.pinimg.com/originals/32/b1/e9/32b1e958839d770f5164970e8f348c5f.jpg?epik=dj0yJnU9SVRRWHBaRkhBMXQycTRYUzlBMzZadjRHY05HM20xVk8mcD0wJm49d2hMYjhUXzFPSDV3ZWpWM29yR2FTQSZ0PUFBQUFBR0FLMGI4", imageName: "Panorama of the night city"),
    Image(url: "https://i.pinimg.com/originals/6f/19/d4/6f19d46e8de198302c50e897acc1015b.jpg", imageName: "Flowers on a mountain slope"),
    Image(url: "https://i.pinimg.com/originals/6e/2e/70/6e2e705150a8ff39c441ab52f047e818.jpg", imageName: "Field road"),
    Image(url: "https://i.pinimg.com/originals/dc/be/cd/dcbecd981d07d3a33b812afc336ad14b.jpg?epik=dj0yJnU9NVdsdHd2ZUhHVU1KY0w3VHlfeGt1aTVIckZrUWxVLWgmcD0wJm49M25kc3NVcG1vZlFqeFp1SmdvcHVDQSZ0PUFBQUFBR0FLMHFv", imageName: "Old soviet motorcycle")
]

