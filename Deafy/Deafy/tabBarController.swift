//
//  tabBarController.swift
//  Deafy
//
//  Created by Yakup on 7.12.2022.
//

import UIKit

class tabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeHeightOfTabbar()
        changeRadiusOfTabbar()
        
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.black, size: CGSize(width: 250, height: 100)).resizableImage(withCapInsets: UIEdgeInsets.zero)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        simpleAnimationWhenSelectItem(item: item)
    }

    func changeHeightOfTabbar()
    {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame    = tabBar.frame
            tabFrame.size.height    = 100
            tabFrame.origin.y   = view.frame.size.height - 100
            tabBar.frame =  tabFrame
        }
    }
    
    func changeRadiusOfTabbar()
        {
            self.tabBar.layer.masksToBounds = true
            self.tabBar.isTranslucent = true
            self.tabBar.layer.cornerRadius = 20
            self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    
    func simpleAnimationWhenSelectItem(item : UITabBarItem)
        {
            guard let barItemView = item.value(forKey: "view") as? UIView else { return }
            
            let timeInterval: TimeInterval = 0.4
            let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5){
                barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
            }
            propertyAnimator.addAnimations({barItemView.transform = .identity},
                                           delayFactor: CGFloat(timeInterval))
            propertyAnimator.startAnimation()
        }

}
extension UIImage {
   class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
   }
}
