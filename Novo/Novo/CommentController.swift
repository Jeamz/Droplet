//
//  CommentController.swift
//  Novo
//
//  Created by James Avery on 8/4/17.
//  
//

import UIKit

class CommentController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height)
        collectionView?.backgroundColor = .gray
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Comments")
        navBar.setItems([navItem], animated: false);
        
        collectionView?.register(PostCell.self, forCellWithReuseIdentifier: "cellid")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
}

class PostCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let discLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userPic: UIImageView = {
        let userPic = UIImageView()
        userPic.translatesAutoresizingMaskIntoConstraints = false
        userPic.backgroundColor = .blue
        userPic.layer.cornerRadius = 18
        userPic.layer.masksToBounds = true
        return userPic
    }()
    
    let lineSeperater: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .black
        return line
    }()
    
    func setupViews() {
        addSubview(usernameLabel)
        addSubview(userPic)
        addSubview(discLabel)
        addSubview(lineSeperater)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-55-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": usernameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-40-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": usernameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0]-335-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": userPic]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": userPic]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-55-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": discLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": discLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lineSeperater]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lineSeperater]))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
