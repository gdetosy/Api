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

    private let imageURLStr = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fru.wikipedia.org%2Fwiki%2F%25D0%259F%25D1%2580%25D0%25B8%25D1%2580%25D0%25BE%25D0%25B4%25D0%25B0&psig=AOvVaw2AGOjnXAHzL5GQkrkIQB4e&ust=1671981679533000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJj8yqLHkvwCFQAAAAAdAAAAABAJ"

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
                }
            }
        } // .resume()
        task.resume()
    }
}
