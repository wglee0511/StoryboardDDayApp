//
//  CategoryViewController.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/15/24.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    func setLayout () {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .estimated(120) )
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.interItemSpacing = .fixed(20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        categoryCollectionView.collectionViewLayout = layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Event.Category.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
        
        let currentValue = Event.Category.allCases[indexPath.row]
        collection.categoryImageView.image = UIImage(named: currentValue.rawValue)
        
        collection.titleLabel.text = currentValue.title
        
        return collection
    }
    
    
}
