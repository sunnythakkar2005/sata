//
//  showListOFPostsTableViewController.swift
//  sataSwift
//
//  Created by Sunny Thakkar on 7/08/2016.
//  Copyright © 2016 Sunny Thakkar. All rights reserved.
//

import UIKit
import Parse

class showListOFPostsTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let posts:NSMutableArray=[]
    var category:NSString!
    let textCellIdentifier = "TextCell"
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.retriveParsePosts()
        self.tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: textCellIdentifier)

        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: self.view.bounds.size.width, height: 44))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "SomeTitle");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(showListOFPostsTableViewController.doneBtn));
        navItem.rightBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: false);
    }
    
    func doneBtn() {
        //save things
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.posts.count
    }
    
    func  retriveParsePosts() ->Void  {
        
        print(category)
        
        let query = PFQuery(className:"item")
        
        query.limit = 20
        query.orderByDescending("CreatedAt")
        query.whereKey("category", equalTo: self.category)
        
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                            for object in objects!
                            {
                    // Do something
                    
                            self.posts.addObject(object)
                            }
                
                
                            print(self.posts)
                
                
                            self.tableview.reloadData()
                
                            }
                
            else {print(error)}
        }
        
    }

    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)

        // Configure the cell...
        
        
        
        
        let row = indexPath.row
        cell.textLabel?.text = self.posts.valueForKey("title")[row] as? String
        
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
