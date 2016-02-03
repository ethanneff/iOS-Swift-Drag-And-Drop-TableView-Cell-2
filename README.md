# iOS-Swift-Drag-And-Drop-TableView-Cell-2

**purpose** better user experience for reordering a list.

**vision** able to reorder table view cells based on drag and drop gesture.

**methodology** coded in Swift, uses Apple's tableView.canMoveRowAtIndexPath, tableView.moveRowAtIndexPath, tableView.didSelectRowAtIndexPath, tableView.editingStyleForRowAtIndexPath, tableViewCell.showsReorderControl, and tableViewCell.setEditing to reorder the cells based on drag and drop gestures.

**status** this solution only works well if the visual suits your needs. Since UITableViewCellReorderControl is a private Apple API, I was unable to modify the location of the drag and drop button. If you want a better alternative, please [use this solution instead](https://github.com/ethanneff/iOS-Swift-Drag-And-Drop-TableView-Cell-3).


![image](http://i.imgur.com/7YQdkqv.gif)
