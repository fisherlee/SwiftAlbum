//
//  FirstViewController.swift
//  SwiftAlbum
//
//  Created by liwei on 16/7/5.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit


class AlbumController: UITableViewController {
    
    struct AlbumConstraint {
        static let albumCellId = "albumCellId";
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


    // MARK: - UITableViewDataSource
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 50
//    }
    
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(AlbumConstraint.albumCellId, forIndexPath: indexPath) as! AlbumTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        //
        //        cell.mySwitchStatus = {(_status)->Void in
        //            print(indexPath.row, "-",(_status))
        //        }
        
        //简写
        //cell.mySwitchStatus = {
        //    print("\(indexPath.row)-\($0)")
        //}
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previewController = self.storyboard?.instantiateViewControllerWithIdentifier(PreviewViewController.PreviewContainer.StoryboardId)
        self.navigationController?.pushViewController(previewController!, animated: true)
    }
}

