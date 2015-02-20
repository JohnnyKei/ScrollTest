//
//  ViewController.swift
//  ScrollTest
//
//  Created by kei on 2015/02/21.
//  Copyright (c) 2015年 kei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    let items = NSMutableArray()
    var photoTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...10{
            items.addObject("item\(index)")
        }
        
        
        
        var bottomImageView = UIImageView(frame: CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50))
        bottomImageView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(bottomImageView)
        
        var rect = self.view.frame
        rect.size.height -= 50
        photoTableView = UITableView(frame: rect, style: UITableViewStyle.Plain)
        photoTableView.delegate = self
        photoTableView.dataSource = self
        photoTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(photoTableView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row] as? String
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.size.width
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        println("\(scrollView.contentOffset)")
        var indexPath :NSIndexPath?
        if scrollView.contentOffset.y == 0 {
            indexPath = photoTableView.indexPathForRowAtPoint(CGPointMake(0, 0))
            photoTableView.scrollToRowAtIndexPath(indexPath!, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
        }else{
            indexPath = photoTableView.indexPathForRowAtPoint(scrollView.contentOffset)
            photoTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: indexPath!.row + 1, inSection: indexPath!.section), atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
        }
        println("row\(indexPath?.row)")
        
        
    }

}

