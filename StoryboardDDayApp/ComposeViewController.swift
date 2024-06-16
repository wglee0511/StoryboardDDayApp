//
//  ComposeViewController.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/16/24.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var composeData: ComposeData?
    var selectedBackgroundIndex: IndexPath?
    var selectedFontIndex: IndexPath?
    
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
        guard let text = titleTextFiled.text else { return }
        
        composeData?.title = text
        
        if let composeData {
            let composeDataEventValue = Event(composeDate: composeData)
            
            dummyEvents.append(composeDataEventValue)
            NotificationCenter.default.post(name: .INSERT_DATE_DATA, object: nil)
            
            dismiss(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var randomNumber = Int.random(in: 0 ..< colors.count)
        selectedBackgroundIndex = IndexPath(item: randomNumber, section: 0)
        composeData?.backgroundColor = colors[randomNumber]
        backgroundColorCollectionView.reloadData()
        
        randomNumber = Int.random(in: 0 ..< colors.count)
        selectedFontIndex = IndexPath(item: randomNumber, section: 0)
        composeData?.fontColor = colors[randomNumber]
        textColorCollectionView.reloadData()
        
        titleTextFiled.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if titleTextFiled.isFirstResponder {
            titleTextFiled.resignFirstResponder()
        }
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
        
        cell.checkBoxImageView.isHidden = true
        
        if let selectedBackgroundIndex, selectedBackgroundIndex == indexPath, collectionView == backgroundColorCollectionView {
            cell.checkBoxImageView.isHidden = false
        } else if let selectedFontIndex, selectedFontIndex == indexPath,
                  collectionView == textColorCollectionView {
            cell.checkBoxImageView.isHidden = false
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
            
            if collectionView == backgroundColorCollectionView {
                composeData?.backgroundColor = targetColor
            } else {
                composeData?.fontColor = targetColor
            }
        }
        
        if collectionView == backgroundColorCollectionView {
            if let selectedBackgroundIndex, selectedBackgroundIndex != indexPath {
                
                let cell = collectionView.cellForItem(at: selectedBackgroundIndex) as? ColorPickerCollectionViewCell
                cell?.checkBoxImageView.isHidden = true
            }
            
            selectedBackgroundIndex = indexPath
        } else {
            if let selectedFontIndex, selectedFontIndex != indexPath {
                
                let cell = collectionView.cellForItem(at: selectedFontIndex) as? ColorPickerCollectionViewCell
                cell?.checkBoxImageView.isHidden = true
            }
            
            selectedFontIndex = indexPath
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorPickerCollectionViewCell {
            cell.checkBoxImageView.isHidden = false
        }
    }
}


extension ComposeViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        if !continuously {
            
            let indexPath = IndexPath(item: colors.count, section: 0)
            let isBackgroundColor = viewController.title == "배경색"
            
            if isBackgroundColor {
                composeData?.backgroundColor = color
                
                if let selectedBackgroundIndex, selectedBackgroundIndex != indexPath {
                    if let collectionViewValue = backgroundColorCollectionView.cellForItem(at: selectedBackgroundIndex) as? ColorPickerCollectionViewCell{
                        collectionViewValue.checkBoxImageView.isHidden = true
                    }
                }
                
                selectedFontIndex = indexPath
                
                if let collectionViewValue = backgroundColorCollectionView.cellForItem(at: indexPath) as? ColorPickerCollectionViewCell{
                    collectionViewValue.checkBoxImageView.isHidden = false
                }
                
            } else {
                composeData?.fontColor = color
                
                if let selectedFontIndex, selectedFontIndex != indexPath {
                    if let collectionViewValue = textColorCollectionView.cellForItem(at: selectedFontIndex) as? ColorPickerCollectionViewCell{
                        collectionViewValue.checkBoxImageView.isHidden = true
                    }
                }
                
                selectedFontIndex = indexPath
                
                if let collectionViewValue = textColorCollectionView.cellForItem(at: indexPath) as? ColorPickerCollectionViewCell{
                    collectionViewValue.checkBoxImageView.isHidden = false
                }
            }
        }
    }
}


extension ComposeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onPressSave(self)
        
        return true
    }
}
