<<<<<<< HEAD
//
//  ViewController.swift
//  DrawPad
//
//  Created by Jean-Pierre Distler on 13.11.14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

=======
>>>>>>> newbranch
import UIKit

class PassTouchesScrollView: UIScrollView {
    
<<<<<<< HEAD
    var delegatePass : UIViewController?
=======
    var delegatePass : ViewController?
>>>>>>> newbranch
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("scrollBegan")
        // Notify it's delegate about touched
        self.delegatePass?.touchesBegan(touches, withEvent: event)
        
        if self.dragging == true {
            self.nextResponder()?.touchesBegan(touches, withEvent: event)
        } else {
            super.touchesBegan(touches, withEvent: event)
        }
        
    }
    
<<<<<<< HEAD
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("cancled")
        super.touchesCancelled(touches, withEvent: event)
        
        self.delegatePass?.touchesCancelled(touches, withEvent: event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("scrollMoved")
=======
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //print("scrollMoved")
>>>>>>> newbranch
        //print("zoomscale", self.zoomScale)
        //print("contentOffset" + "%f %f",self.contentOffset.x,self.contentOffset.y)
        // Notify it's delegate about touched
        if(!self.dragging){
            self.delegatePass?.touchesMoved(touches, withEvent: event)
        }
        else{
            print("dragging!")
        }
        if self.dragging == true {
            self.nextResponder()?.touchesMoved(touches, withEvent: event)
        } else {            
            super.touchesMoved(touches, withEvent: event)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("scrollEnded")
        self.delegatePass?.touchesEnded(touches, withEvent: event)
        
        if self.dragging == true {
            self.nextResponder()?.touchesEnded(touches, withEvent: event)
        } else {
            super.touchesEnded(touches, withEvent: event)
        }
    }
<<<<<<< HEAD
}

class ViewController: UIViewController, UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate { // UIScrollViewDelegate
=======
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("cancled")
        super.touchesCancelled(touches, withEvent: event)
        
        self.delegatePass?.touchesCancelled(touches, withEvent: event)

    }
    
    
}

class ViewController: UIViewController, UIScrollViewDelegate { // UIScrollViewDelegate
    
    let minZoom : CGFloat = 1.0
    let maxZoom : CGFloat = 15.0
>>>>>>> newbranch
    
  var lastPoint = CGPoint.zero
  var red: CGFloat = 0.0
  var green: CGFloat = 0.0
  var blue: CGFloat = 0.0
  var brushWidth: CGFloat = 10.0
  var opacity: CGFloat = 1.0
  var swiped = false
<<<<<<< HEAD
    
=======

>>>>>>> newbranch

  @IBOutlet weak var scrollView: PassTouchesScrollView!
  @IBOutlet weak var drawView: UIView!
  @IBOutlet weak var mainImageView: UIImageView!
  @IBOutlet weak var tempImageView: UIImageView!
<<<<<<< HEAD


  override func viewDidLoad() {
    super.viewDidLoad()
    //self.view.insertSubview(mainImageView, atIndex: 1)
    //self.view.insertSubview(tempImageView, atIndex: 0)
    scrollView.delegate = self
    scrollView.delegatePass = self
    
    //[self.scrollView.layer setAnchorPoint,:CGPointMake(300, 300)];

    //print("it is ",scrollView.contentSize.width / 2, scrollView.contentSize.height / 2)
=======
  @IBOutlet weak var locationView: UIView!
  @IBOutlet weak var locationBox: UIView!
    

  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView.delegate = self
    scrollView.delegatePass = self
    scrollView.minimumZoomScale = minZoom
    scrollView.maximumZoomScale = maxZoom
    
    self.locationView.layer.borderWidth = 1.5
    self.locationView.layer.borderColor = UIColor(red:153/255.0, green:102/255.0, blue:51/255.0, alpha: 0.5).CGColor
    self.locationBox.layer.borderWidth = 1.5
    self.locationBox.layer.borderColor = UIColor(red:0, green:0, blue:1, alpha: 0.7).CGColor
>>>>>>> newbranch
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
<<<<<<< HEAD
    // Dispose of any resources that can be recreated.
  }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        mainImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func LoadPhoto(sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    
    }
    
    
=======
  }
>>>>>>> newbranch
  @IBAction func reset(sender: AnyObject) {
    mainImageView.image = nil
  }

  @IBAction func share(sender: AnyObject) {
    UIGraphicsBeginImageContext(mainImageView.bounds.size)
    mainImageView.image?.drawInRect(CGRect(x: 0, y: 0,
        width: mainImageView.frame.size.width, height: mainImageView.frame.size.height))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    presentViewController(activity, animated: true, completion: nil)
  }
  
  @IBAction func pencilPressed(sender: AnyObject) {
<<<<<<< HEAD
    // 1
=======
>>>>>>> newbranch
    var index = sender.tag ?? 0
    if index < 0 || index >= colors.count {
        index = 0
    }
    
<<<<<<< HEAD
    // 2
    (red, green, blue) = colors[index]
    
    // 3
=======
    (red, green, blue) = colors[index]

>>>>>>> newbranch
    if index == colors.count - 1 {
        opacity = 1.0
    }
  }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.locationInView(self.view)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
<<<<<<< HEAD
        
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        //self.scrollView.contentOffset.x + fromPoint.x * scrollView.zoomScale
        print("zoomscale : ", scrollView.zoomScale)
        // 2
        CGContextMoveToPoint(context, (self.scrollView.contentOffset.x + fromPoint.x) / scrollView.zoomScale, (self.scrollView.contentOffset.y + fromPoint.y) / scrollView.zoomScale)
        CGContextAddLineToPoint(context, (self.scrollView.contentOffset.x + toPoint.x) / scrollView.zoomScale, (self.scrollView.contentOffset.y + toPoint.y) / scrollView.zoomScale)
        
        // 3
=======

        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))

        CGContextMoveToPoint(context, (self.scrollView.contentOffset.x + fromPoint.x) / scrollView.zoomScale, (self.scrollView.contentOffset.y + fromPoint.y) / scrollView.zoomScale)
        CGContextAddLineToPoint(context, (self.scrollView.contentOffset.x + toPoint.x) / scrollView.zoomScale, (self.scrollView.contentOffset.y + toPoint.y) / scrollView.zoomScale)

>>>>>>> newbranch
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, brushWidth)
        CGContextSetRGBStrokeColor(context, red, green, blue, 1.0)
        CGContextSetBlendMode(context, CGBlendMode.Normal)
<<<<<<< HEAD
        
        // 4
        CGContextStrokePath(context)
        
        // 5
=======

        CGContextStrokePath(context)

>>>>>>> newbranch
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
<<<<<<< HEAD
        // 6
=======

>>>>>>> newbranch
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.locationInView(view)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
<<<<<<< HEAD
            // 7
=======
>>>>>>> newbranch
            lastPoint = currentPoint
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        tempImageView.image = nil
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Ended")
        print("it is ",scrollView.contentSize.width / 2, scrollView.contentSize.height / 2)
        
        if !swiped {
            // draw a single point
            drawLineFrom(lastPoint, toPoint: lastPoint)
        }
        
        // Merge tempImageView into mainImageView
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        mainImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.Normal, alpha: 1.0)
        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.Normal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        tempImageView.image = nil
    }
    
<<<<<<< HEAD
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        //print("viewForZomming")
        //print("before center : ",self.drawView.center)
        let screenRect = UIScreen.mainScreen().bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        //self.drawView.center = CGPointMake(screenWidth / 2, screenHeight / 2)
        //print("after center : ",self.drawView.center)
        //self.scrollView.contentOffset = CGPoint(x:-50, y:-50)
        //print("offset : ",self.scrollView.contentOffset)
        return self.drawView
    }
    
=======
    func updateLocationView() {
        let screenRect = UIScreen.mainScreen().bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        locationView.frame = CGRectMake(screenWidth / 5 * 4 - 10, 70, screenWidth / 5, screenHeight / 5)
        
        var zoom = self.scrollView.zoomScale
        if(zoom < minZoom){
            zoom = 1
        } else if(zoom > maxZoom){
            zoom = maxZoom
        }
        
        let inBoxLocationX : CGFloat = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width * screenWidth / 5 / zoom
        let inBoxLocationY : CGFloat = self.scrollView.contentOffset.y / self.scrollView.bounds.size.height * screenHeight / 5 / zoom
        locationBox.frame = CGRectMake(screenWidth / 5 * 4 - 10 + inBoxLocationX, 70 + inBoxLocationY, screenWidth / 5 / zoom, screenHeight / 5 / zoom)
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.locationView.alpha = 1.0
            self.locationBox.alpha = 1.0
            }, completion: nil)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.drawView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //print("scrollViewDidScroll")
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        //print("scrollViewDidZoom")
        updateLocationView()
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming")
        updateLocationView()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating")
    }
    
    func scrollViewDidScrollToTop(scrollView: UIScrollView) {
        print("scrollViewDidScrollToTop(scrollView")
    }
    
    func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool {
        print("scrollViewShouldScrollToTop")
        return true
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        print("scrollViewWillBeginZooming")
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging(scrollView")
    }
    
    
>>>>>>> newbranch
    let colors: [(CGFloat, CGFloat, CGFloat)] = [
        (0, 0, 0),
        (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0),
        (1.0, 0, 0),
        (0, 0, 1.0),
        (51.0 / 255.0, 204.0 / 255.0, 1.0),
        (102.0 / 255.0, 204.0 / 255.0, 0),
        (102.0 / 255.0, 1.0, 0),
        (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0),
        (1.0, 102.0 / 255.0, 0),
        (1.0, 1.0, 0),
        (1.0, 1.0, 1.0),
        ]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let settingsViewController = segue.destinationViewController as! SettingsViewController
        settingsViewController.delegate = self
        settingsViewController.brush = brushWidth
        settingsViewController.opacity = opacity
        
        settingsViewController.red = red
        settingsViewController.green = green
        settingsViewController.blue = blue
    }

    
}

extension ViewController: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController) {
        self.brushWidth = settingsViewController.brush
        self.opacity = settingsViewController.opacity
        
        self.red = settingsViewController.red
        self.green = settingsViewController.green
        self.blue = settingsViewController.blue
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> newbranch
