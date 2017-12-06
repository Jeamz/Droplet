//
//  MainController.swift
//  Novo
//
//  Created by James Avery on 8/6/17.
//  
//

import UIKit
import FMMosaicLayout

class MainController: UICollectionViewController, FMMosaicLayoutDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height)
        collectionView?.backgroundColor = .white
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Drops")
        navItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navBar.setItems([navItem], animated: false);
        
        let mosaicLayout: FMMosaicLayout = FMMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        
        collectionView?.register(ImageCell.self, forCellWithReuseIdentifier: "Image-Cell")
    
        MainAPI.shared.getImages { (response) in
            print(response.images)
            print("WORKS")
        }
    }
    
    func handleLogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: FMMosaicLayout, numberOfColumnsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Image-Cell", for: indexPath) as? ImageCell else { return UICollectionViewCell() }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath!) -> FMMosaicCellSize {
        return indexPath.item % 4 == 0 ? FMMosaicCellSize.big: FMMosaicCellSize.small
    }
    
}

class ImageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imgview: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .green
        iv.image = #imageLiteral(resourceName: "ballon")
        return iv
    }()
    
    func setupViews(){
        addSubview(imgview)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imgview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imgview]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







