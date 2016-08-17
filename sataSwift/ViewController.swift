//
//  ViewController.swift
//  sataSwift
//
//  Created by Sunny Thakkar on 4/08/2016.
//  Copyright © 2016 Sunny Thakkar. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
        //
    
    let posts:NSMutableArray=[]
    @IBOutlet weak var collectionView: UICollectionView!

    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        
        
        
        cell.myLabel.text = self.posts.valueForKey("Name")[indexPath.item] as? String
        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        cell.layer.backgroundColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 0.2
        cell.layer.cornerRadius = 2
        
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        performSegueWithIdentifier("showPostsList", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showPostsList" {
            
            let indexPaths : NSArray = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath : NSIndexPath = indexPaths[0] as! NSIndexPath
            
           // print (self.posts.objectAtIndex(indexPath.row).valueForKey("Name") as! String)
            
            let vc = segue.destinationViewController as! showListOFPostsTableViewController
            
            vc.category = self.posts.objectAtIndex(indexPath.row).valueForKey("Name") as! String
                
            
            
            
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.collectionView.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //collectionView!.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        

        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        view.addSubview(blurEffectView)
        view.bringSubviewToFront(collectionView)
        collectionView.backgroundColor = UIColor.clearColor()
        
        //Testing PArse
        
        /*let testObject = PFObject(className: "TestObject1")
        testObject["foo1"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")}*/
        
        print("Hello World!")
        
        self.loadCategories()
        
        
        
        
    }
    
    func loadCategories() -> Void {
        
        
        NSLog("Calling load categories")
        
            let query = PFQuery(className:"Categories")
            query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
                if error == nil {
                    for object in objects!
                    
                    {
                        // Do something
                        
                        self.posts.addObject(object)
                    }
                    
                    print("Hello World!")
                    print(self.posts)
                    
                
                    self.collectionView.reloadData()
                    
                    }
                
                else {print(error)}
                    }
        
      
            
        }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        return CGSize(width: (screenWidth/3)-6, height: (screenWidth/3)-6);
    }


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

