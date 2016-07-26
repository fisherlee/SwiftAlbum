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
        
        print(UIScreen.mainScreen().scale)
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        print(path)
        
        let albumPath = path.stringByAppendingString("/Swift_Album")
        let fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(albumPath) {
            do {
                try fileManager.createDirectoryAtPath(albumPath, withIntermediateDirectories: true, attributes: nil)
            }catch let error as NSError{
                print(error)
            }
           
        }
        print(albumPath)
        
        let thumbPath = path.stringByAppendingString("/Swift_Album_Thumb")
        // Do any additional setup after loading the view, typically from a nib.
       
        var loop = NSRunLoop.init()
        loop.addPort(NSMachPort(), forMode: NSDefaultRunLoopMode)
        loop.run()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - button action
    @IBAction func addAlbum() -> Void {
        let addAlertController = UIAlertController.init(title: "Alert", message: "add action", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        addAlertController.addTextFieldWithConfigurationHandler { (textField: UITextField) in
            textField.placeholder = "input title"
        }
        
        addAlertController.addTextFieldWithConfigurationHandler { (textField: UITextField) in
            textField.placeholder = "input description"
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action:UIAlertAction) in
            
        }
        addAlertController.addAction(cancelAction)
        
        let addAction = UIAlertAction.init(title: "Add", style: UIAlertActionStyle.Default) { (action:UIAlertAction) in
            
            print("title: \(addAlertController.textFields![0].text)")
            print("description: \(addAlertController.textFields![1].text)")
        }
        addAlertController.addAction(addAction)
        
        self.presentViewController(addAlertController, animated: true, completion: nil)
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
        let previewController = self.storyboard?.instantiateViewControllerWithIdentifier(ThumbViewController.ThumbContainer.StoryboardId)
        self.navigationController?.pushViewController(previewController!, animated: true)
    }
}

