//
//  ThirdViewController.swift
//  SwiftAlbum
//
//  Created by liwei on 16/7/14.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class ExtendTextAttachment: NSTextAttachment {
    
    var imageWidth: CGFloat!
    
    override func attachmentBoundsForTextContainer(textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect {
        
        return self.scaleImageSize(imageWidth)
    }
    
    func scaleImageSize(width: CGFloat) -> CGRect {
        var factor: CGFloat = 1.0;
        
        //获取原本图片大小
        let originSize = self.image?.size;
        
        //计算缩放系数
        factor = width/originSize!.width;
        
        //创建新的Size
        let newSize = CGRectMake(0, 0, originSize!.width*factor, originSize!.height*factor);
        
        return newSize;
    }
}

class ThirdViewController: UIViewController {
    
    
    let text = "欢迎该站点的目标是成为 Jekyll 的全面指南。\n\r包括一些内容如：搭建和运行你的站点、创建以及管理内容、定制站点的展现和外观、在不同的环境中发布、以及参与到 Jekyll 将来的开发的一些建议。Jekyll 究竟是什么 Jekyll 是一个简单的博客形态的静态站点生产机器。它有一个模版目录，其中包含原始文本格式的文档，通过 Markdown （或者 Textile） 以及 Liquid 转化成一个完整的可发布的静态网站，你可以发布在任何你喜爱的服务器上。Jekyll 也可以运行在 GitHub Page 上，也就是说，你可以使用 GitHub 的服务来搭建你的项目页面、博客或者网站，而且是完全免费的。提示™、说明以及警告这个指南随处都包含一些有用的小知识点，它们使 Jekyll 在使用过程中更便利、有趣，而且不会出错。以下是这些标识：欢迎该站点的目标是成为 Jekyll 的全面指南。\n\r包括一些内容如：搭建和运行你的站点、创建以及管理内容、定制站点的展现和外观、在不同的环境中发布、以及参与到 Jekyll 将来的开发的一些建议。Jekyll 究竟是什么 Jekyll 是一个简单的博客形态的静态站点生产机器。它有一个模版目录，其中包含原始文本格式的文档，通过 Markdown （或者 Textile） 以及 Liquid 转化成一个完整的可发布的静态网站，你可以发布在任何你喜爱的服务器上。Jekyll 也可以运行在 GitHub Page 上，也就是说，你可以使用 GitHub 的服务来搭建你的项目页面、博客或者网站，而且是完全免费的。提示™、说明以及警告这个指南随处都包含一些有用的小知识点，它们使 Jekyll 在使用过程中更便利、有趣，而且不会出错。"
    
    var textView: UITextView!
    
    var imgView: UIImageView!
    
    var storage: NSTextStorage!
    var layoutManager: NSLayoutManager!
    var container: NSTextContainer!
    
    var attributes4: [String : AnyObject]? = nil
    
    var gestureStartingPoint: CGPoint!
    var gestureStartingCenter: CGPoint!
    var butterflyPath: UIBezierPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------
        let  paragraph = NSMutableParagraphStyle.init()
        paragraph.alignment = NSTextAlignment.Left;
        paragraph.firstLineHeadIndent = 2;
        paragraph.paragraphSpacingBefore = 1;
        paragraph.lineSpacing = 2;
        paragraph.hyphenationFactor = 1.0;
        
        //let fonts = UIFont.familyNames()
        //Academy Engraved LET, Thonburi
        let font: UIFont = UIFont.systemFontOfSize(15)
        attributes4 = [NSFontAttributeName:font,
                       NSForegroundColorAttributeName: UIColor.blackColor()]
        //NSParagraphStyleAttributeName: paragraph]
        let strDisplayText4 = text;
        
        let attributedText4 = NSMutableAttributedString.init(string: strDisplayText4, attributes: attributes4)
        attributedText4.addAttributes([NSFontAttributeName:UIFont.systemFontOfSize(26)], range:NSMakeRange(0, 98))
        attributedText4.addAttributes([NSFontAttributeName:UIFont.italicSystemFontOfSize(18)], range:NSMakeRange(200, 10))
        attributedText4.addAttributes([NSForegroundColorAttributeName:UIColor.redColor()], range:NSMakeRange(300, 20))
        
        //------------
        let textRect = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-44)
        
        container = NSTextContainer.init(size: CGSizeMake(textRect.size.width, CGFloat.max))
        container.widthTracksTextView = true
        
        layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(container)
        
        storage = NSTextStorage.init(attributedString: attributedText4)
        storage.addLayoutManager(layoutManager)
        
        
        textView = UITextView.init(frame: textRect)
        textView.editable = false
        textView.backgroundColor = UIColor.whiteColor()
        textView.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(textView)
        
        //textView.text = text
        textView.attributedText = attributedText4;
        
        
 
        imgView = UIImageView.init(image: UIImage.init(named: "IMG_0292.jpg"))
        imgView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 200)
        imgView.userInteractionEnabled = true
        //textView.addSubview(imgView)
        
        //let imgPan = UIPanGestureRecognizer.init(target: self, action: #selector(ThirdViewController.imgPanAction(_:)))
        //imgView.addGestureRecognizer(imgPan)
        
        //------
        
        let menuItem1 = UIMenuItem.init(title: "B", action: #selector(ThirdViewController.customMenuAction1(_:)))
        let menuItem2 = UIMenuItem.init(title: "A+", action: #selector(ThirdViewController.customMenuAction2(_:)))
        let menuItem3 = UIMenuItem.init(title: "A-", action: #selector(ThirdViewController.customMenuAction2(_:)))
        let menuItem4 = UIMenuItem.init(title: "I", action: #selector(ThirdViewController.customMenuAction2(_:)))
        let menuItem5 = UIMenuItem.init(title: "U", action: #selector(ThirdViewController.customMenuAction2(_:)))
        
        let menuController = UIMenuController.sharedMenuController()
        menuController.menuItems = [menuItem1, menuItem2,menuItem3, menuItem4,menuItem5]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func customMenuAction1(item: UIMenuItem) -> Void {
        print("customMenuAction1")
        
        let attr = NSMutableAttributedString.init(attributedString: textView.attributedText)
        attr.setAttributes([NSFontAttributeName:  UIFont.boldSystemFontOfSize(15)], range: textView.selectedRange)
        textView.attributedText = attr
    }
    
    func customMenuAction2(item: UIMenuItem) -> Void {
        print("customMenuAction2")
    }
    
    func imgPanAction(pan:UIPanGestureRecognizer) -> Void {
        if pan.state == UIGestureRecognizerState.Began {
            gestureStartingPoint = pan.translationInView(textView)
            gestureStartingCenter = imgView!.center
            
            if gestureStartingPoint.x != 0 {
                return
            }

        }else if pan.state == UIGestureRecognizerState.Changed {
   
            let currentPoint = pan.translationInView(imgView)
            let distanceX = currentPoint.x - gestureStartingPoint.x
            let distanceY = currentPoint.y - gestureStartingPoint.y
            
            var newCenter = gestureStartingCenter
            if distanceX != 0 {
                newCenter.x = self.view.frame.size.width/2
            }else {
                newCenter.x += distanceX
            }
            
            
            newCenter.y += distanceY
            
            imgView!.center = newCenter
            
            var bframe: CGRect = textView.convertRect(imgView.bounds, fromView: imgView)
            bframe.origin.x -= textView.textContainerInset.left
            bframe.origin.y -= textView.textContainerInset.top
            
            let path1 = UIBezierPath(roundedRect: bframe, cornerRadius: 10)
            //textView.textContainer.exclusionPaths = [path1]
            container.exclusionPaths = [path1]
            
            

            
        }else if pan.state == UIGestureRecognizerState.Ended {
            gestureStartingPoint = CGPoint.zero
            gestureStartingCenter = CGPoint.zero
        }
    }
    

    
    @IBAction func runAction() -> Void {
        
        
        print(layoutManager.textContainers)
        print("image view =:\(imgView.frame.origin.x), y:\(imgView.frame.origin.y), h:\(imgView.frame.size.height)")
        
        var mutiple: CGFloat = 0
        if textView.text.characters.count > 0 {
            let tt = textView.text as String
            let index = tt.startIndex.advancedBy(1)
            let lineText = tt.substringToIndex(index)
            let lineRect = lineText.boundingRectWithSize(CGSizeMake(self.view.frame.size.width, 10000), options:.UsesLineFragmentOrigin, attributes:[NSFontAttributeName: UIFont.systemFontOfSize(15)], context: nil)
            print(lineRect.size.height)
            
            mutiple = imgView.frame.size.height/lineRect.size.height
            
            print("\(floor(mutiple)),\(ceil(mutiple))");
        }
        
       
        
        let attrText = NSMutableAttributedString.init(attributedString: textView.attributedText)

        let attachment = ExtendTextAttachment()
        attachment.bounds = imgView.frame
        attachment.image = imgView.image
        attachment.imageWidth = 320
        let imgAttr = NSAttributedString.init(attachment: attachment)
        
        print("\(imgAttr.size().height)")
        
        let selectRange = textView.selectedRange
        
        attrText.insertAttributedString(imgAttr, atIndex: selectRange.location)
        
        //-------
        let rect = attrText.boundingRectWithSize(CGSizeMake(self.view.frame.size.width, 10000), options:.UsesLineFragmentOrigin, context: nil)
        
        let width = self.view.frame.size.width
        let height = rect.size.height + 6// self.view.frame.size.height
        
        
        let cgWidth = Int(width)
        let cgHeight = Int(height)
        
        let bgImg = UIImage.init(named: "abc.png")
        
        let context = CGBitmapContextCreate(nil, cgWidth, cgHeight, 8, 4*cgWidth, CGColorSpaceCreateDeviceRGB(), CGImageAlphaInfo.PremultipliedFirst.rawValue|CGBitmapInfo.ByteOrder32Big.rawValue)
        
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), bgImg?.CGImage)

        
        CGContextGetClipBoundingBox(context)
        
        CGContextTranslateCTM(context, 10, height)
        CGContextScaleCTM(context, 1, -1)
        
        UIGraphicsPushContext(context!)
        
        
        attrText.drawInRect(CGRectMake(0, 30, width-20, height))
        
        UIGraphicsPopContext()
        
        let imgCombined = CGBitmapContextCreateImage(context)
        
        let retImg = UIImage.init(CGImage: imgCombined!)
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let imgPath = path.stringByAppendingString("/ret.png")
        
        let fileManager = NSFileManager.defaultManager()
        fileManager .createFileAtPath(imgPath, contents: UIImagePNGRepresentation(retImg), attributes: nil)
        
        print("image path:\(imgPath)")
    }

}
