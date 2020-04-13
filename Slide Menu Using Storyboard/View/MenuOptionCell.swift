//
//  MenuOptionCell.swift
//  Slide Menu Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 10/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    
    //MARK: - Properties
    let iconImageDescription : UIImageView = {
        
        var imageView = UIImageView()
        imageView.contentMode  = .scaleAspectFit
       // imageView.backgroundColor = .green
        imageView.clipsToBounds = true
      
        return imageView
        
    }()
    
    
    let labelDescription : UILabel = {
        
       var label = UILabel()
        
        label.font = .systemFont(ofSize: 25)
        label.tintColor = .red
      //  label.text = "Hello World"
        return label
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
        selectionStyle = .none
     
        iconImageConstraint()
        labelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Handler
    
    func iconImageConstraint(){
           
             addSubview(iconImageDescription)
             iconImageDescription.translatesAutoresizingMaskIntoConstraints = false
             iconImageDescription.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
             iconImageDescription.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
             iconImageDescription.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
             iconImageDescription.heightAnchor.constraint(equalToConstant: 40).isActive = true
             iconImageDescription.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    func labelConstraint(){
        
        
        addSubview(labelDescription)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelDescription.leftAnchor.constraint(equalTo: iconImageDescription.rightAnchor,constant: 12).isActive = true
        labelDescription.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }
    
    
   

}
