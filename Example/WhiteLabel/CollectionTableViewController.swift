//
//  CollectionTableViewController.swift
//
//  Created by Alex Givens http://alexgivens.com on 7/28/16
//  Copyright © 2016 Noon Pacific LLC http://noonpacific.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


import UIKit
import WhiteLabel

class CollectionTableViewController: UITableViewController {
    
    var label : Label?
    var collections : [Collection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WhiteLabel.getCollections(
            nil,
            search: nil,
            success: { collections in
                self.collections = collections
                
                for collection in self.collections {
                    print(collection._description)
                }
                
                self.tableView.reloadData()
            },
            failure: { error in
                print("Error retrieving collections")
            }
        )
    
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CollectionCell", forIndexPath: indexPath)
        
        let collection = collections[indexPath.row]
        
        cell.textLabel!.text = collection.title;
        cell.detailTextLabel!.text = collection.slug;
        
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CollectionsToMixtapes" {
            if let mixtapeTableViewController = segue.destinationViewController as? MixtapeTableViewController {
                if let selectedIndexPath = self.tableView.indexPathsForSelectedRows?[0] {
                    mixtapeTableViewController.collection = collections[selectedIndexPath.row]
                }
                
            }
        }
    }
}