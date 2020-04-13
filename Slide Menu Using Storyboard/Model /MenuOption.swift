//
//  MenuOption.swift
//  Slide Menu Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 11/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//
import Foundation
import UIKit

enum MenuOption :Int,CustomStringConvertible {
  
    case Profile
    case Inbox
    case Notifications
    case Setting
    
    var description: String{
        
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Setting: return "Setting"
            
            
        }
    }
    
    var imageDescription : UIImage{
        
        switch self {
        case .Profile: return UIImage(systemName: "person.fill") ?? UIImage()
        case .Inbox: return UIImage(systemName: "envelope.fill") ?? UIImage()
        case .Notifications: return UIImage(systemName: "text.justify") ?? UIImage()
        case .Setting: return UIImage(systemName: "hammer.fill") ?? UIImage()
        }
    }
    
    
}
