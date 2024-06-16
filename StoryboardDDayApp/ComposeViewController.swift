//
//  ComposeViewController.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/16/24.
//

import UIKit

class ComposeViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemOrange,
        .systemYellow,
        .systemCyan,
        .systemMint,
        .systemPurple,
        .systemIndigo,
        .systemGray2,
        .systemGray3,
        .black,
        .white
    ]

    @IBOutlet weak var backgroundColorCollectionView: UICollectionView!
    
    
    @IBOutlet weak var textColorCollectionView: UICollectionView!
    
    @IBOutlet weak var titleTextFiled: UITextField!
    
    @IBAction func onPressSave(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ComposeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ColorPickerCollectionViewCell.self), for: indexPath) as! ColorPickerCollectionViewCell
        
        let isLastCell = indexPath.item == colors.count
        
        if isLastCell {
            cell.colorPickerImageView.image = UIImage(named: "color-picker")
            cell.tintColor = nil
        } else {
            let targetColor = colors[indexPath.item]
            
            cell.colorPickerImageView.image = UIImage(named: "color-picker")?.withRenderingMode(.alwaysTemplate)
            
            cell.colorPickerImageView.tintColor = targetColor
        }
        
        return cell
    }
    
    
}

extension ComposeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == colors.count {
            let colorPicker = UIColorPickerViewController()
            colorPicker.title = collectionView == backgroundColorCollectionView ? "배경색" : "글자색"
            colorPicker.supportsAlpha = false
            colorPicker.delegate = self
            
            present(colorPicker, animated: true)
        } else {
            let targetColor = colors[indexPath.item]
            
            
        }
    }
}


extension ComposeViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        
        
    }
}
