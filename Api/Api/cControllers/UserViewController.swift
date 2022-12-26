//
//  UserViewController.swift
//  Api
//
//  Created by tosy on 25.12.22.
//

import UIKit

class UserViewController: UIViewController {
    var user: User?
    @IBOutlet var email: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var website: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var userNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func post(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Post", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Post") as! PostTableViewController
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
  
    @IBAction func albumsbtn(_ sender: Any) {}

    @IBAction func toDobtn(_ sender: Any) {}

  
    @IBAction func map(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    

    
    
    private func setupUI() {
        nameLbl.text = "Name: \(user?.name ?? "")"
        userNameLbl.text = "Username: \(user?.username ?? "")"
        email.text = "Email: \(user?.email ?? "")"
        phone.text = "Phone: \(user?.phone ?? "")"
        website.text = "Website: \(user?.website ?? "")"
    }
}
