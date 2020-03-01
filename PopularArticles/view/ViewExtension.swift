//
//  ViewExtension.swift
//  PopularArticles
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import UIKit





@IBDesignable
extension UIView{
    @IBInspectable var  carnerRedius:CGFloat{
       
        set{
            self.layer.cornerRadius = newValue
        }
        
        get{
            return  self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        set{
            self.layer.borderWidth =  newValue
        }
        get{
            return self.layer.borderWidth
        }
        
    }
    
    @IBInspectable var borderColor:UIColor{
        set{
            self.layer.borderColor =  newValue.cgColor
        }
        
        get{
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
}
