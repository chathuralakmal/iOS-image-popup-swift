//
//  PopupViewController.swift
//  Popup
//
//  Created by Chathura on 1/17/17.
//  Copyright © 2017 Chathura. All rights reserved.
//

import UIKit
import QuartzCore

class PopupViewController: UIViewController {
    
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.popUpView.layer.cornerRadius = 5
        self.popUpView.layer.shadowOpacity = 0.5
        self.popUpView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        
        
        //Tap gesture on image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showInView(_ aView: UIView!, withImage image : UIImage!,animated: Bool)
    {
        aView.addSubview(self.view)
        imageView!.image = image
        
        
//        let imageView = UIImageView(image: image!)
//        imageView.image = image;
        
        /** Get Device Screen Size **/
//        let screenSize = UIScreen.main.bounds
//        let cgFloatWidth: CGFloat = screenSize.width
//        let width = Float(cgFloatWidth)
//        let cgFloatHeight: CGFloat = screenSize.height
//        let height = Float(cgFloatHeight)
//        
//        
//        print(image.size.height);
//        print(image.size.width);
//        
//        print(screenSize.height);
//        print(screenSize.width);
//        
//        var x:Float = 0.0
//        var y:Float = 0.0
//        if(image.size.width > screenSize.width || image.size.height > screenSize.height){
//            x = width-80.0;
//            y = height-250.0;
//        }else{
//            x = width;
//            y = height;
//        }
        
        
        //self.popUpView.frame = CGRect(x:0, y:0 , width:Int(x), height:Int(y))
        //imageView.frame = CGRect(x: 0, y: 0, width: Int(x), height: Int(y));
       // self.popUpView.addSubview(imageView);
        
        //messageLabel!.text = message
        if animated
        {
            self.showAnimate()
        }
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.removeAnimate()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
