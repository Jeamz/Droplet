//
//  ProfileController.swift
//  Novo
//
//  Created by James Avery on 8/4/17.
//  
//

import UIKit
import FMMosaicLayout

class ProfileController: UIViewController, UICollectionViewDataSource, FMMosaicLayoutDelegate {
    //limited edition
    
    let profileImgView: UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        //imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "james")
        imgview.layer.cornerRadius = 50
        imgview.layer.masksToBounds = true
        return imgview
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "jamesavery400"
        label.textColor = UIColor.white
        label.font = UIFont(name:"Avenir Next", size: 30)
        label.numberOfLines = 0
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Followers"
        label.textColor = .white
        label.font = UIFont(name:"Avenir Next-DemiBold", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Following"
        label.textColor = .white
        label.font = UIFont(name:"Avenir Next-DemiBold", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let followersButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(r: 90, g: 200, b: 250)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let followingButton: UIButton = {
        let visualEffect = UIButton()
        visualEffect.layer.cornerRadius = 8
        visualEffect.layer.masksToBounds = true
        visualEffect.backgroundColor = UIColor(r: 90, g: 200, b: 250)
        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        return visualEffect
    }()
    
    let lineSeperater: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .gray
        line.layer.cornerRadius = 5
        line.layer.masksToBounds = true
        return line
    }()
    
    let cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(r: 65, g: 105, b: 225)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            //UIColor(r: 65, g: 105, b: 225)

        setupViewComps()
    
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell-id")
        cv.dataSource = self
    }
    
    func setupProfileImgView(){
        view.addSubview(profileImgView)
        profileImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImgView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -260).isActive = true
        profileImgView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupUsernameLabel() {
        view.addSubview(usernameLabel)
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -190).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupFollowersLabel() {
        view.addSubview(followersLabel)
        followersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -45).isActive = true
        followersLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -115).isActive = true
        followersLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        followersLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupFollowingLabel() {
        view.addSubview(followingLabel)
        followingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 45).isActive = true
        followingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -115).isActive = true
        followingLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        followingLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupFollowersButton() {
        view.addSubview(followersButton)
        followersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -45).isActive = true
        followersButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -115).isActive = true
        followersButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        followersButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func setupFollowingButton() {
        view.addSubview(followingButton)
        followingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 45).isActive = true
        followingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -115).isActive = true
        followingButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        followingButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func setupLineSeperater(){
        view.addSubview(lineSeperater)
        lineSeperater.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeperater.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        lineSeperater.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        lineSeperater.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    func setupCollection(){
        view.addSubview(cv)
        cv.frame = CGRect(x: 0, y: 245, width: view.frame.width, height: view.frame.height)
        let mosaicLayout: FMMosaicLayout = FMMosaicLayout()
        cv.collectionViewLayout = mosaicLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell-id", for: indexPath)
        let red = UIColor.red
        let green = UIColor.green
        let yellow = UIColor.yellow
        let gray = UIColor.gray
        let purple = UIColor.purple
        let orange = UIColor.orange
        let brown = UIColor.brown
        let colorArry = [red, green, yellow, gray, purple, orange, brown]
        cell.backgroundColor = .gray
            //colorArry[Int(arc4random_uniform(UInt32(colorArry.count)))]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: FMMosaicLayout, numberOfColumnsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath!) -> FMMosaicCellSize {
        return indexPath.item % 4 == 0 ? FMMosaicCellSize.big: FMMosaicCellSize.small
    }
    
    func setupViewComps(){
        setupProfileImgView()
        setupUsernameLabel()
        setupFollowersButton()
        setupFollowingButton()
        setupFollowersLabel()
        setupFollowingLabel()
        setupLineSeperater()
        setupCollection()

    }
}


