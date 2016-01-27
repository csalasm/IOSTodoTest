//
//  ResultsTableViewController.swift
//  IOSTodoTest
//
//  Created by INFTEL 22 on 25/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    // MARK: Properties
    
    var arrayResults = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        var alert: UIAlertView = UIAlertView(title: "Loading tests", message: "Please wait...", delegate: nil, cancelButtonTitle: nil);
        
        
        var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 37, 37)) as UIActivityIndicatorView
        loadingIndicator.center = self.view.center;
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.startAnimating();
        
        alert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        
        alert.show();
        
        let examenAction = ExamenActions()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        examenAction.getExamen(appDelegate.usuario!){(arrayExamenes: [Examen]) -> Void in
            dispatch_async(dispatch_get_main_queue()){
                sleep(10)
                self.loadSampleResults()
                self.tableView.reloadData()
                alert.dismissWithClickedButtonIndex(-1, animated: true)
                
            }
        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return arrayResults.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ResultsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ResultsTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let result = arrayResults[indexPath.row]
        
        cell.nameLabel.text = result.nameTest
        cell.scoreLabel.text = String(result.score)
        cell.successesLabel.text = String(result.successes)
        cell.failuresLabel.text = String(result.failures)
        cell.scoreLabel.text = String(result.score)
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

    
    // MARK: - Navigation

    @IBAction func menuButton(sender: UIBarButtonItem) {
        
        let menuTab = (tabBarController as! TabBarController).sidebar
        
        if menuTab.isCurrentlyOpen == false{
            
            menuTab.showInViewController(self, animated: true)
            
        }else{
            
            menuTab.dismissAnimated(true, completion: nil)
        }

    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func loadSampleResults(){
        let res1 = Result(name: "ResPrimero")
        
        let res2 = Result(name: "ResSegundo")
        
        let res3 = Result(name: "ResTercero")
        
        arrayResults += [res1,res2,res3]
    }

}
