//
//  ViewController.swift
//  Api
//
//  Created by tosy on 24.12.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }

    private let imageURLStr = "https://img3.badfon.ru/original/6000x4000/1/e9/arizona-horseshoe-bend-river-1468.jpg"
    private let imageDefault = "https://sites.google.com/site/prirodanasevseegooglgfgf/_/rsrc/1463456237313/home/priroda_gory_nebo_ozero_oblaka_81150_1920x1080.jpg"
    private func fetchImage() {
        guard let url = URL(string: imageURLStr) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()

                if let error = error {
                    print(error.localizedDescription)
                    // добавить дефолтную картинку и отобразить ошибку
                    return
                }

                if let response {
                    print(response)
                }

                print("\n", data ?? "", "\n")

                if let data,
                   let image = UIImage(data: data)
                {
                    self.image.image = image
                } else {
                    // добавить дефолтную картинку
                    guard URL(string: self.imageDefault) != nil else { return }
                }
            }
        }
        task.resume()
    }
}
