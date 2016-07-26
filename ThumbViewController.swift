//
//  PreviewViewController.swift
//  SwiftAlbum
//
//  Created by liwei on 16/7/6.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class ThumbCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    
    override func awakeFromNib() {
        print("awakeFromNib")
        
        let point = CGPointMake(CGRectGetMidX((thumbImageView?.bounds)!), CGRectGetMidY((thumbImageView?.bounds)!))
        let radius = min(CGRectGetMidX((thumbImageView?.bounds)!), CGRectGetMidY((thumbImageView?.bounds)!))
        let bezierPath = UIBezierPath.init(arcCenter: point,
                                           radius: radius,
                                           startAngle: 0,
                                           endAngle: CGFloat(2*M_PI),
                                           clockwise: true)
        let shape = CAShapeLayer()
        shape.path = bezierPath.CGPath
        thumbImageView?.layer.mask = shape
        
        titleLabel!.backgroundColor = UIColor.clearColor()
        titleLabel!.font = UIFont.systemFontOfSize(13)
        titleLabel!.textColor = UIColor.darkGrayColor()
        titleLabel?.textAlignment = NSTextAlignment.Center
    }
}

private let reuseIdentifier = "kThumbCollectionCellId"

class ThumbViewController: UICollectionViewController {
    
    struct ThumbContainer {
        static let StoryboardId = "ThumbStoryboardId"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hidesBottomBarWhenPushed = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(ThumbCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ThumbCell
    
        cell.thumbImageView?.image = UIImage.init(named: "IMG_2635.jpg")
        cell.titleLabel?.text = "cell-\(indexPath.row)"
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let photoController = self.storyboard?.instantiateViewControllerWithIdentifier(PhotoViewController.PhotoContaints.StoryboardId)
        self.navigationController?.pushViewController(photoController!, animated: true)
    }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
