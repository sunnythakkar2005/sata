//
//  showPostDetialsTableViewController.swift
//  
//
//  Created by Sunny Thakkar on 15/08/2016.
//
//

import UIKit
import RKParallaxEffect
import Parse

class showPostDetialsTableViewController: UITableViewController,ImageGalleryDelegate {
    
    var parallaxEffect: RKParallaxEffect!
    var parseObj:PFObject!
    var imageGalleryView:ImageGalleryView!

    override func viewDidLoad() {
        super.viewDidLoad()
        parallaxEffect = RKParallaxEffect(tableView: tableView)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let imageGalleryFrame = CGRect(x: 20, y: 40, width: 300, height: 200)
        imageGalleryView = ImageGalleryView(frame: imageGalleryFrame)
        imageGalleryView.delegate = self
    }
    
    func numberOfImages(inImageGalleryView galleryView: ImageGalleryView) -> Int {
        return 4
    }
    
    func imageGalleryView(galleryView: ImageGalleryView, imageCallback callback: ImageCallback, forImageAtIndex index: Int) {
        
        
        parseObj.valueForKey("image1")!.getDataInBackgroundWithBlock{
            (imageData: NSData?, error: NSError?) -> Void in
            
            
            
            if imageData != nil{
                let image = UIImage(data: imageData!)
                print("image received")
                callback(image: image!)
                //cell.cellAvatarImage.image = image
            } else {
                print(error)
            }
        }
        
       // callback(image: image)
    }
    
    func imageGalleryView(galleryView: ImageGalleryView, didTapImageAtIndex index: Int) {
        print("tapped image at index: \(index)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        parallaxEffect.isParallaxEffectEnabled = true
        parallaxEffect.isFullScreenTapGestureRecognizerEnabled = true
        parallaxEffect.isFullScreenPanGestureRecognizerEnabled = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 400
            
        }
        
        else
        {
            return 20
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postDetailCell", forIndexPath: indexPath)

        // Configure the cell...
        
        if indexPath.row == 0 {
            
            
           // cell.detailTextLabel?.text = parseObj.valueForKey("title") as? String
            //cell.textLabel?.text = "Title"
            
            cell.addSubview(self.imageGalleryView)
            
            
            return cell
        }
        else if indexPath.row == 1 {
            
            cell.detailTextLabel?.text = parseObj.valueForKey("amt") as? String
            cell.textLabel?.text = "Amount"
            
            
            return cell
        }
        else if indexPath.row == 2{
            
            cell.detailTextLabel?.text = parseObj.valueForKey("category") as? String
            cell.textLabel?.text = "Category"
            
            return cell
        }
        
        else if indexPath.row == 3{
            
            cell.detailTextLabel?.text = parseObj.valueForKey("term") as? String
            cell.textLabel?.text = "Term"
            
            return cell
        }

        else if indexPath.row == 4{
            
           cell.textLabel?.text = ""
            
            return cell
        }
            
        else if indexPath.row == 5{
            
            cell.detailTextLabel?.text = parseObj.valueForKey("description") as? String
            cell.textLabel?.text = "Description"
            
            return cell
        }
            
        else{
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
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
