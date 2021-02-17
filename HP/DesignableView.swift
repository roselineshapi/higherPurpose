//
//  DesignableView.swift
//  HP
//
//  Created by user on 2/17/21.
//

import UIKit

class DesignableView: UIView {

    @IBInspectable var shaadowColor: UIColor = UIColor.clear{
        didSet{
            layer.shadowColor = shaadowColor.cgColor
        }
    }
    
    @IBInspectable var shaadowRadius: CGFloat = 0 {
        didSet{
            layer.shadowRadius = shaadowRadius
        }
    }
    
    @IBInspectable var shaadowOpacity: CGFloat = 0 {
        didSet{
            layer.shadowOpacity = Float(shaadowOpacity)
        }
    }
    
    @IBInspectable var shaadowOffsetY: CGFloat = 0 {
        didSet{
            layer.shadowOffset.height = shaadowOffsetY
        }
    }

}
