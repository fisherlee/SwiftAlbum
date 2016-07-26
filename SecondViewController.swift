//
//  SecondViewController.swift
//  SwiftAlbum
//
//  Created by liwei on 16/7/5.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class CricleLabel: UILabel {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let radius = min(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        
        let context = UIGraphicsGetCurrentContext()
        
        //填充
        //        UIColor.clearColor().set()
        //        CGContextFillRect(context, rect)
        //        CGContextAddEllipseInRect(context, self.bounds)
        //        UIColor.whiteColor().set()
        //        CGContextFillPath(context)
        
        //边框
        CGContextSetRGBStrokeColor(context, 254/255, 131/255, 98/255, 1)
        CGContextSetLineWidth(context, 2)
        CGContextAddArc(context, CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds), radius, 0, CGFloat(2*M_PI), 0)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
    }
}

class LineExtendView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let sy = (self.frame.size.height)/3
        for index in 1...3 {
            let shape3 = CAShapeLayer()
            let mpath3 = CGPathCreateMutable()
            shape3.lineWidth = 1
            shape3.strokeColor = UIColor.lightGrayColor().CGColor
            shape3.fillColor = UIColor.clearColor().CGColor
            
            CGPathMoveToPoint(mpath3, nil, 0, CGFloat(index)*sy)
            CGPathAddLineToPoint(mpath3, nil, self.frame.size.width, CGFloat(index)*sy)
            
            shape3.path = mpath3
            self.layer.addSublayer(shape3)
        }
        
        let shape4 = CAShapeLayer()
        let path = CGPathCreateMutable()
        shape4.lineWidth = 1
        shape4.strokeColor = UIColor.lightGrayColor().CGColor
        shape4.fillColor = UIColor.clearColor().CGColor
        CGPathMoveToPoint(path, nil, self.frame.size.width/2, 0)
        CGPathAddLineToPoint(path, nil, self.frame.size.width/2, self.frame.size.height)
        shape4.path = path
        self.layer.addSublayer(shape4)
    }
}


class SecondViewController: UIViewController {

    private var label1: CricleLabel?
    
    var lx: CGFloat = 0
    var ly: CGFloat = 70
    var lw: CGFloat = 0
    var lh: CGFloat = 0

    // MARK: init
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        lx = 10
        ly = 70
        lw = (self.view.frame.size.width - lx*2 - 30)/2
        lh = lw
        
        self.circleExtendLabel()
        self.circleExtendController()
        self.lineExtendController() 

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: 画线
    
    //label上画圆
    func circleExtendLabel() -> Void {
        label1 = CricleLabel.init(frame: CGRectMake(lx, ly, lw, lh))
        label1!.backgroundColor = UIColor.whiteColor()
        label1!.text = "圆环"
        label1!.textAlignment = NSTextAlignment.Center
        label1!.textColor = UIColor.blackColor()
        label1?.font = UIFont.systemFontOfSize(50, weight: 10)
        self.view.addSubview(label1!)
        
        let centerPoint = CGPointMake(CGRectGetMidX(label1!.bounds), CGRectGetMidY(label1!.bounds))
        let radius = min(CGRectGetMidX(label1!.bounds), CGRectGetMidY(label1!.bounds))
        let bezierPath = UIBezierPath.init(arcCenter: centerPoint,
                                           radius: radius,
                                           startAngle: 0,
                                           endAngle: CGFloat(2*M_PI),
                                           clockwise: true)
        let shape1 = CAShapeLayer()
        shape1.path = bezierPath.CGPath
        label1!.layer.mask = shape1
    }

    //Controller 画圆
    func circleExtendController() -> Void {
        let shape2 = CAShapeLayer()
        let mutablePath = CGPathCreateMutable()
        shape2.lineWidth = 2
        shape2.strokeColor = UIColor.redColor().CGColor
        shape2.fillColor = UIColor.clearColor().CGColor
        CGPathAddEllipseInRect(mutablePath, nil, CGRectMake(CGRectGetMaxX(label1!.frame)+30, ly, lw, lh))
        shape2.path = mutablePath
        self.view.layer.addSublayer(shape2)
    }
    
    //Controller画线
    func lineExtendController() -> Void {
        
        let v = LineExtendView.init(frame: CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-44))
        self.view.addSubview(v)

    }
}

