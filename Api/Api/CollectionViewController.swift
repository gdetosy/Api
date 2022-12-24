//
//  CollectionViewController.swift
//  Api
//
//  Created by tosy on 24.12.22.
//

import UIKit


enum UserActons: String, CaseIterable /* позволяет из перечисления сделать массив */ {
    case downloadImage = "Download Image"
    case users = "Users"
}



class CollectionViewController: UICollectionViewController {

    
    private let reuseIdentifier = "Cell"
    private let userActons = UserActons.allCases

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.infoLbl.text = userActons[indexPath.row].rawValue
        return cell
    }

    // MARK: - UICollectionViewDelegate
  
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userActon = userActons[indexPath.row]
        let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
        switch userActon {

            //        переход на загрузгку картинки
        case .downloadImage:
                let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "ViewController")
                self.navigationController?.pushViewController(nextViewController, animated: true)

            //        переход на таблицу
            case .users: let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "TableViewController")
                self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}
//
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 30), height: 70)
    }
}
