# ExtensionUtil

ExtensionUtil is a framework which extends the functionality of swift and adds many utility functions to built in swift classes.

These functions contain code that comes handy in everyday development.

As of now framework contains extensions for 

 - UIWindow
 - UIView
 - UIViewController
 - UILabel
 - UICollectionView
 - UITableView
 - TimeInterval

Content below provide details on functions available in each extension

## UIWindow

##### Function: `replaceRootViewControllerWith(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)`
##### description: `Replaces the root viewcontroller`
---
##### Function: `topMostViewController() -> UIViewController?`
##### description: `Get the top most view controller i.e. the one that is currently visible on screen.`

## UIView

##### Variable: `isCirculer` 
##### description: `IBDesignable Bool if set to true for certain view the view renders as a circular view` 
---
##### Variable: cornerRadius
##### description: `IBInspectable CGFloat for setting corner radius of a view`
---
##### Variable: `borderWidth`
##### description: `IBInspectable CGFloat for setting border width of a view`
---
##### Variable: `borderColor`
##### description: `IBInspectable UIColor for setting border color of a view`
---
##### Variable: `shadowRadius`
##### description: `IBInspectable CGFloat for setting shadow radius of a view`
---
##### Variable: `shadowOpacity`
##### description: `IBInspectable Float for setting shadow opacity of a view`
---
##### Variable: `shadowOffset`
##### description: `IBInspectable CGSize for setting shadow size of a view`
---
##### Variable: `shadowColor`
##### description: `IBInspectable UIColor for setting shadow color of a view`
---
##### Function: `addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0, cornerRadius: CGFloat = 1.0, addBorder: Bool = **false**, borderColor: UIColor = UIColor.lightText, borderWidth: CGFloat = 1.0)`
##### description: `Add shadow to a UIView`
---
##### Function: `addTopBorderWithColor(color: UIColor, width: CGFloat)`
##### description: `Add top border to a UIView`
---
##### Function: `addRightBorderWithColor(color: UIColor, width: CGFloat)`
##### description: `Add right border to a UIView`
---
##### Function: `addBottomBorderWithColor(color: UIColor, width: CGFloat)`
##### description: `Add bottom border to a UIView`
---
##### Function: `addLeftBorderWithColor(color: UIColor, width: CGFloat)`
##### description: `Add left border to a UIView`
---
##### Function: `addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0)`
##### description: `Add shadow to top or bottom of a UIView as specified by location parameter`
---
##### Function: `addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0)`
##### description: `Add shadow to a UIView`
---
##### Function: `snapshot() -> UIImage`
##### description: `Get snapshot of a view`
---
##### Function: `asImage() -> UIImage`
##### description: `Get view as a image i.e. a picture of view`
---
##### Function: `roundCorner(uiViewCorner: UIViewCorners, radius: CGFloat = 5.0)`
##### description: `Round specific corner of a UIView as specified by uiViewCorner parameter`
---
##### Function: `roundCorners(uiViewCorners: VerticalLocation, radius: CGFloat = 5.0)`
##### description: `Round top or bottom corners of a UIView as specified by uiViewCorners parameter`
---
##### Function: `addBorderWithRoundCorners(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat)`
##### description: `Add border with rounded corners to a UIView`
---
##### Function: `rotate360Degrees(duration: CFTimeInterval = 3)`
##### description: `Rotate a UIView 360 degrees with animation`
---
##### Function: `dropShadow(color: UIColor = UIColor.black, opacity: Float = 0.5, offSet: CGSize = CGSize(width: -1, height: 1), radius: CGFloat = 1, scale: Bool = **true**)`
##### description: `Add drop shadow to a UIView`
---
##### Function: `hide()`
##### description: `Hides the view`
---
##### Function: `show()`
##### description: `Shows the view`

## UIController

##### Function: `addCustomLeftNavButton(image:UIImage? = **nil**, title: String = "", action: Selector)`
##### description: `Add left nav button`
---
##### Function: `addCustomRightNavButton(image:UIImage? = **nil**, title: String = "", action: Selector)`
##### description: `Add right nav button`
---
##### Function: `topMostViewController() -> UIViewController`
##### description: `Get the top most view controller i.e. the one that is currently visible on screen.`
---
##### Function: `setDismissOnTap()`
##### description: `Set the view controller to dismiss on tap`
---
##### Function: `showOkAlert(_ msg: String)`
##### description: `Shows UIAlertController with a OK button and message.`
---
##### Function: `showOkAlert(_ msg: String)`
##### description: `Shows UIAlertController with a OK button and message.`
---
##### Function: `showOkAlert(_ msg: String)`
##### description: `Shows UIAlertController with a OK button and message.`
---
##### Function: `showOkAlertWithOKCompletionHandler(_ msg: String, okAction: @escaping (UIAlertAction) -> Void)`
##### description: `Shows UIAlertController with a OK button and message.`

## UILabel
##### Variable: `maxNumberOfLines` 
##### description: `Maximum no of lines required for the text assigned to UILabel to make it fully visible to user` 
---
##### Function: `addTrailing(ellipseText: String = "", trailingText: String, trailingTextFont: UIFont = UIFont.systemFont(ofSize: 17), trailingTextColor: UIColor = UIColor.black)`
##### description: `Add trailing text to UILabel`
---
##### Variable: `visibleTextLength` 
##### description: `Lenght of text visible to user i.e. no of characters visible before the start of ellipses (...)` 

## UICollectionView
##### Function: `register<T: UICollectionViewCell>(**_**: T.Type, indexPath: IndexPath) -> T`
##### description: `Registers a cell with collectionview and returns a dequeued instance of that cell.`

## UITableView
##### Function: `register<T: UICollectionViewCell>(**_**: T.Type, indexPath: IndexPath) -> T`
##### description: `Registers a cell with collectionview and returns a dequeued instance of that cell.`

## TimeInterval
##### Function: `stringFromTimeInterval() -> String`
##### description: `Get formatted time interval in format of HH:mm:ss`

# Usage

#### Get the compiled framework. 

1. Clone this repository
2. Open project in xcode
3. Set target to **ExtensionUtil-Universal > Generic iOS Device**
4. Build the project
5. Compiled framework after successful build we be located at **Project_Dir -> Output -> ExtensionUtil-Release-iphoneuniversal**


#### Include framework into your project

1. Copy **ExtensionUtil.framework** to you project at **Project_Dir -> Frameworks**  
2. From project navigator select **Project** this will reveal project settings
3. From project settings select **Target**
4. Goto **Target -> Build Phases** select drop down **Link Binary With Libraries** now  drag and drop **ExtesnionUtil.framework** (*the one which you copied in step 1*)
5. Goto **Target -> Build Settings** set the filter to **All** now look for dropdown called **Search Paths**
6.  Under the dropdown set the value of **Framework Search Paths** to **$(PROJECT_DIR)/Frameworks**
7. Goto **Target -> General** select drop down **Framework, Libraries, and Embedded Content**
8. Under drop down locate the added framework and set its **Embed** value to **Embed & Sign** 
9. Now goto **App Delegate** and add import statement **@_exported  import ExtensionUtil** this will import the framework for the scope of entire project
10. You have successfully imported the framework :relieved:. 

