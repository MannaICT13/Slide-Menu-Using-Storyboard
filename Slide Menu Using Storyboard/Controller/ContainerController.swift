//
//  ContainerController.swift
//  Slide Menu Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 10/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import UIKit

class ContainerController : UIViewController{
    
    // MARK: - Properties
    
    var delegate :HomeViewControllerDelegate!
    
    var menuController : MenuController!
    var centerController : UIViewController!
    var isExtended = false
    // MARK: - init
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        naviBarColor()
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return isExtended
    }
    
      override var preferredStatusBarStyle: UIStatusBarStyle{
      
          return .lightContent
      }
      
    
    // MARK: - Handler
    
    
    func naviBarColor(){
        
        
        let navBar = navigationController?.navigationBar
        
        navBar?.tintColor = .white
        navBar?.barTintColor = .darkGray
        navBar?.barStyle = .black
        navBar?.isTranslucent = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        
    }
  
    
    func configureHomeController(){
        
        let homeController = HomeViewController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    
    
    
    func configureMenuController(){
        
        if menuController == nil{
            
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
          
        }
        
    }
    
    
    func animatePanel(shouldExpend : Bool,menuOption:MenuOption?){
        
        if shouldExpend{
            //show
          UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity:0 , options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
          
            }, completion: nil)
        }else{
            

            //hide
           // UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
               // self.centerController.view.frame.origin.x = 0
          //  }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                  self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else{return}
                self.didSelectMenuOption(menuOption: menuOption)
                
            }
            
           
    
        }
   
     //   animateStatusBar()
        
        
    }
    
    
    func didSelectMenuOption(menuOption: MenuOption?){
        
        switch menuOption {
            
        case .Profile:
            profileManage()
        case .Inbox:
            print("Inbox")
        case .Notifications:
            print("Notification")
        case .Setting:
            print("Setting")

        case .none:
            print("None")
        }
        
        
    }
    
    func profileManage(){
        
        let profileVC = storyboard?.instantiateViewController(identifier: "ProfileController") as! ProfileController
        self.navigationController?.pushViewController(profileVC, animated: true)
        
        
    }
    
    
  /*  func animateStatusBar(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
        
 
 */
    
}
extension ContainerController :HomeViewControllerDelegate{
  
    func handleMenuToggle(formanuOption menuOption: MenuOption?) {
      
      if !isExtended{
          configureMenuController()
      }
      
      isExtended = !isExtended
        animatePanel(shouldExpend: isExtended,menuOption: menuOption)
        
        
    }
    
    
    
}
