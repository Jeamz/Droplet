//
//  FourthController.swift
//  Novo
//
//  Created by James Avery on 7/26/17.
//  Copyright © 2017 Sage Technologies LLC. All rights reserved.
//

import UIKit

class FourthController: UIViewController {

    let img: UIImageView = {
        let imgview = UIImageView()
        imgview.image = UIImage(named: "fone")
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.contentMode = .scaleAspectFill
        imgview.clipsToBounds = true
        return imgview
    }()
    
    let postTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "| VR: iPhone"
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont(name:"AvenirNext-DemiBold", size: 40)
        return label
    }()
    
    let paragraphDes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A VR headset that can be powered by your iPhone and can go anywhere"
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Regular", size: 25)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 65, g: 105, b: 225)
        
        let swipeRightRec = UISwipeGestureRecognizer()
        swipeRightRec.addTarget(self, action: #selector(navBack) )
        swipeRightRec.direction = .right
        self.view!.addGestureRecognizer(swipeRightRec)
        
        let swipeComments = UISwipeGestureRecognizer()
        swipeComments.addTarget(self, action: #selector(handleComments) )
        swipeComments.direction = .up
        self.view!.addGestureRecognizer(swipeComments)
        
        view.addSubview(img)
        view.addSubview(postTitle)
        view.addSubview(paragraphDes)
        
        setupImg()
        setupTitle()
        setupPost()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func navBack(){
        let layout = UICollectionViewFlowLayout()
        let mainScreen = MainController(collectionViewLayout: layout)
        present(mainScreen, animated: true, completion: nil)
    }
    
    func handleComments(){
        let comments = CommentController()
        present(comments, animated: true, completion: nil)
    }
    
    func setupImg(){
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -167).isActive = true
        img.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        img.heightAnchor.constraint(equalToConstant: view.frame.height*0.5).isActive = true
    }
    
    func setupTitle(){
        postTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        postTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 35).isActive = true
        postTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        postTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupPost(){
        paragraphDes.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        paragraphDes.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 190).isActive = true
        paragraphDes.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        paragraphDes.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }

}
