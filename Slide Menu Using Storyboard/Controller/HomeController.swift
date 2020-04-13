//
//  HomeController.swift
//  Slide Menu Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 10/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UIViewController{
    
    //MARK: - properties
    
    var delegate : HomeViewControllerDelegate!
    //MARK: - init
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    
    //MARK: - Handler
    
    @objc func handleMenuToggle( _ sender : UINavigationItem){
        delegate.handleMenuToggle(formanuOption: nil)
    }
    
    func configureNavigationBar(){
        
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Slide Menu"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3" )?.withRenderingMode(.alwaysOriginal).withTintColor(.white), style: .plain, target: self, action: #selector(handleMenuToggle(_:)))
        
        
        
    }
    
}
