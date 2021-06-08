//
//  Extensions.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 07/06/21.
//

import UIKit
import SDWebImage

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    
    func addDropShadow(shadowColor: CGColor = UIColor.black.cgColor, shadowOffset: CGSize = CGSize(width: 0, height: 2), shadowOpacity: Float = 0.22, shadowRadius: CGFloat = 1.5){
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        //        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: shadowRadius).cgPath
        if layer.cornerRadius == 0 {
            layer.cornerRadius = 10
        }
        layer.masksToBounds = false
        
        backgroundColor = .white
    }
}

extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController
        {
            let top = topViewController(nav.visibleViewController)
            return top
        }
        
        if let tab = base as? UITabBarController
        {
            if let selected = tab.selectedViewController
            {
                let top = topViewController(selected)
                return top
            }
        }
        
        if let presented = base?.presentedViewController
        {
            let top = topViewController(presented)
            return top
        }
        return base
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIImageView {
    func loadImage(link: String, placeholderImage: UIImage? = nil) {
        guard !link.isEmpty else {
            return
        }
        
        var originalUrl :String = link
        if (!originalUrl.contains("%20")) {
            originalUrl = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        if (!originalUrl.contains("%40")) {
            originalUrl = link.replacingOccurrences(of: "%40", with: "@")
        }
        load(link: originalUrl, placeholderImage: placeholderImage)
    }
    
    func load(link: String, placeholderImage: UIImage? = nil) {
        if let pholderImage = placeholderImage {
            self.image = pholderImage
        }
        if let linkURL = URL(string: link) {
            self.sd_imageTransition = .fade
            self.sd_setImage(with: linkURL, placeholderImage: placeholderImage, options: [.scaleDownLargeImages, .refreshCached], completed: nil)
        }
    }
}
