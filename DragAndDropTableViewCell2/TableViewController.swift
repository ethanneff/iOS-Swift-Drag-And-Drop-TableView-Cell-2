//
//  TableViewController.swift
//  asdas
//
//  Created by Ethan Neff on 2/3/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

class ReorderTableViewCell: UITableViewCell {
  
  override var showsReorderControl: Bool {
    // short-circuit to on
    get {
      return true
    }
    set { }
  }
  
  override func setEditing(editing: Bool, animated: Bool) {
    // ignore any attempts to turn it off
    if editing == false {
      return
    }
    
    super.setEditing(editing, animated: animated)
  }
}

class TableViewController: UITableViewController {
  var items = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // nav controller properties
    navigationController?.navigationBarHidden = true
    
    // table properties
    tableView.contentInset = UIEdgeInsetsZero
    tableView.separatorInset = UIEdgeInsetsZero
    tableView.scrollIndicatorInsets = UIEdgeInsetsZero
    tableView.layoutMargins = UIEdgeInsetsZero
    tableView.tableFooterView = UIView(frame: CGRectZero)
    tableView.allowsMultipleSelectionDuringEditing = false
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    
    // cell properties
    cell.separatorInset = UIEdgeInsetsZero
    cell.layoutMargins = UIEdgeInsetsZero
    cell.textLabel?.text = String(items[indexPath.row])
    cell.editing = self.tableView(tableView, canMoveRowAtIndexPath: indexPath)
    
    return cell
  }
  
  override func setEditing(editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    
    self.tableView.allowsMultipleSelectionDuringEditing = editing
  }
  
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // enable reordering
    return true
  }
  
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    // finished moving cell
    if (fromIndexPath.row != toIndexPath.row) {
      swap(&items[fromIndexPath.row], &items[toIndexPath.row])
    }
    print(items)
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // hide selection
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
  }
  
  override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    return .None
  }
  
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    for view: UIView in cell.subviews {
      if NSStringFromClass(view.classForCoder) == "UITableViewCellReorderControl" {
        // need to make the view invisible and expand the entire cell
        // stopped because UITableViewCellReorderControl is a private Apple API
        // it it would be better to make a custom drag based on a UILongPressGestureRecognizer
      }
    }
  }
  
}
