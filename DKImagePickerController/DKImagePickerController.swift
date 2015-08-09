//
//  DKImagePickerController.swift
//  CustomImagePicker
//
//  Created by ZhangAo on 14-10-2.
//  Copyright (c) 2014年 ZhangAo. All rights reserved.
//

import UIKit
import AssetsLibrary

// Delegate
@objc public protocol DKImagePickerControllerDelegate : NSObjectProtocol {
    /// Called when right button is clicked.
    ///
    /// :param: images Images of selected
    func imagePickerControllerDidSelectedAssets(images: [DKAsset]!)
    
    /// Called when cancel button is clicked.
    func imagePickerControllerCancelled()
}

class DKImagePickerControllerResource {

    static let selectedImage: [UInt8] = [0x89,0x50,0x4e,0x47,0xd,0xa,0x1a,0xa,0x0,0x0,0x0,0xd,0x49,0x48,0x44,0x52,0x0,0x0,0x0,0x3e,0x0,0x0,0x0,0x3e,0x8,0x6,0x0,0x0,0x0,0x73,0xc1,0xa8,0x44,0x0,0x0,0x0,0x1,0x73,0x52,0x47,0x42,0x0,0xae,0xce,0x1c,0xe9,0x0,0x0,0x0,0x1c,0x69,0x44,0x4f,0x54,0x0,0x0,0x0,0x2,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x1f,0x0,0x0,0x0,0x28,0x0,0x0,0x0,0x1f,0x0,0x0,0x0,0x1f,0x0,0x0,0x1,0x51,0x7e,0x60,0xc0,0x6d,0x0,0x0,0x1,0x1d,0x49,0x44,0x41,0x54,0x68,0x5,0xec,0x98,0xb1,0xa,0xc2,0x30,0x18,0x84,0x33,0xb9,0x9,0x42,0xd5,0xd9,0xcd,0xe7,0xf1,0x8d,0x9a,0xa1,0x83,0x53,0x1f,0xcb,0x27,0x70,0x70,0x11,0xf4,0x9,0xa4,0x6b,0x5b,0x62,0x32,0x5c,0xf9,0x49,0xe2,0xd6,0x5c,0x85,0xfe,0x82,0xdc,0x5f,0x85,0xdc,0x7f,0xf7,0xc5,0x45,0xb3,0xb7,0x83,0x5b,0xe3,0xdb,0xac,0x31,0x74,0xc8,0xac,0xc1,0xd7,0x46,0x3e,0x4b,0xfc,0x60,0xc7,0xc7,0xd1,0xba,0xcb,0xf9,0xea,0xb6,0xa6,0xf0,0xab,0x60,0xe1,0x5d,0x65,0x87,0x9b,0xcf,0xf2,0xcc,0x79,0x24,0xc1,0x43,0xe8,0x53,0xeb,0x76,0x85,0xf3,0x4e,0xc7,0xe7,0x96,0x9a,0xf3,0x33,0x1f,0xfe,0x93,0xb,0x9f,0x4,0xf,0xa4,0xa7,0xad,0x8,0xc3,0x9c,0x21,0x7f,0x9d,0x15,0xc8,0xc7,0xdf,0x25,0xc1,0x19,0xd7,0x5b,0xf6,0x19,0x2f,0x54,0xe8,0xb9,0x8b,0xcf,0x4d,0x82,0xcb,0xa5,0x18,0x73,0xbc,0x10,0xeb,0x59,0x83,0xa3,0x69,0x6,0x65,0xe9,0x1,0x5f,0xb6,0x2a,0x71,0x34,0x2e,0x69,0x30,0x66,0xf8,0xb2,0x55,0x89,0xa3,0x71,0x6,0x65,0xe9,0x1,0x5f,0xb6,0x2a,0x71,0x34,0x2e,0x69,0x30,0x66,0xf8,0xb2,0x55,0x89,0xa3,0x71,0x6,0x65,0xe9,0x1,0x5f,0xb6,0x2a,0x71,0x34,0x2e,0x69,0x30,0x66,0xf8,0xb2,0x55,0x89,0xa3,0x71,0x6,0x65,0xe9,0x1,0x5f,0xb6,0x2a,0x71,0x34,0x2e,0x69,0x30,0x66,0xf8,0xb2,0x55,0x89,0xa3,0x71,0x6,0x65,0xe9,0x51,0xd5,0xc3,0x8,0x6f,0xa6,0x2e,0x4e,0xdc,0x7,0x7f,0x31,0x3,0xc3,0xeb,0xf,0x82,0xf7,0xd,0x96,0x61,0xea,0xe2,0xc1,0x4d,0x7d,0xdf,0x54,0x75,0xdf,0xf8,0xbf,0x80,0xdf,0xcc,0x6b,0xbf,0x7c,0x70,0xf9,0x83,0x2f,0x38,0xc7,0xb7,0xe9,0xb,0x0,0x0,0xff,0xff,0xb3,0x9,0xd,0x78,0x0,0x0,0x0,0xe9,0x49,0x44,0x41,0x54,0xed,0xd8,0x31,0xa,0x2,0x31,0x18,0x44,0xe1,0x5c,0x40,0xb0,0x50,0x6b,0x3b,0xcf,0xe3,0x91,0x52,0x5a,0x79,0x3e,0xef,0xa2,0x44,0xfe,0x66,0x58,0xf2,0x94,0xad,0x7d,0xae,0x20,0xcc,0xe,0x53,0xf8,0x25,0x5b,0xd9,0xe,0xfd,0x39,0x96,0xdf,0x26,0xfd,0x2c,0x8d,0x95,0x1b,0x8a,0xd,0xee,0x3a,0x1,0x5c,0x30,0xa,0x97,0x37,0x1a,0x38,0x51,0x64,0xea,0xa,0x70,0xa2,0x70,0x79,0xa3,0x81,0x13,0x45,0xa6,0xae,0x0,0x27,0xa,0x97,0x37,0x1a,0x38,0x51,0x64,0xea,0xa,0x70,0xa2,0x70,0x79,0xa3,0x81,0x13,0x45,0xa6,0xae,0x0,0x27,0xa,0x97,0x37,0x1a,0x38,0x51,0x64,0xea,0xa,0x70,0xa2,0x70,0x79,0xa3,0x81,0x13,0x45,0xa6,0xae,0x0,0x27,0xa,0x97,0x37,0x1a,0x38,0x51,0x64,0xea,0xa,0x70,0xa2,0x70,0x79,0xa3,0x81,0x13,0x45,0xa6,0xae,0x0,0x27,0xa,0x97,0x37,0x1a,0x38,0x51,0x64,0xea,0xa,0x70,0xa2,0x70,0x79,0xa3,0x81,0x13,0x45,0xa6,0xae,0x0,0xe7,0x5c,0x5c,0x6e,0x63,0xe7,0x22,0xb7,0x56,0xa6,0xd9,0x89,0xbf,0x97,0x4f,0x7d,0x5c,0x6d,0xf0,0x32,0xad,0xc2,0x8f,0xfd,0xf5,0x38,0xdf,0xc7,0xde,0x82,0x2f,0x4b,0x99,0x56,0xe1,0x35,0xa8,0x61,0x9d,0xd2,0x2f,0xbf,0xf6,0xf5,0xdb,0xcb,0xf0,0x9,0x5d,0x46,0xbc,0xea,0xf3,0xc9,0x58,0x9f,0x37,0xb8,0xf5,0x66,0xbf,0xb9,0xfe,0xf6,0xc6,0xdf,0xc7,0x30,0x3d,0x26,0x69,0x8a,0x70,0x5a,0x0,0x0,0x0,0x0,0x49,0x45,0x4e,0x44,0xae,0x42,0x60,0x82]
}

//////////////////////////////////////////////////////////////////////////////////////////

// Cell Identifier
let GroupCellIdentifier = "GroupCellIdentifier"
let ImageCellIdentifier = "ImageCellIdentifier"

// Nofifications
let DKImageSelectedNotification = "DKImageSelectedNotification"
let DKImageUnselectedNotification = "DKImageUnselectedNotification"

// Group Model
class DKAssetGroup : NSObject {
    var groupName: String!
    var thumbnail: UIImage!
    var group: ALAssetsGroup!
}

// Asset Model
public class DKAsset: NSObject {
    public var thumbnailImage: UIImage?
    public lazy var fullScreenImage: UIImage? = {
        return UIImage(CGImage: self.originalAsset.defaultRepresentation().fullScreenImage().takeUnretainedValue())
    }()
    public lazy var fullResolutionImage: UIImage? = {
        return UIImage(CGImage: self.originalAsset.defaultRepresentation().fullResolutionImage().takeUnretainedValue())
    }()
    public var url: NSURL?
    
    private var originalAsset: ALAsset!
    
    // Compare two assets
    override public func isEqual(object: AnyObject?) -> Bool {
        let other = object as! DKAsset!
        return self.url!.isEqual(other.url!)
    }
}

// Internal
extension UIViewController {
    var imagePickerController: DKImagePickerController? {
        get {
            let nav = self.navigationController
            if nav is DKImagePickerController {
                return nav as? DKImagePickerController
            } else {
                return nil
            }
        }
    }
}

//////////////////////////////////////////////////////////////////////////////////////////
// MARK: - Show All Iamges In Group
//////////////////////////////////////////////////////////////////////////////////////////

class DKImageGroupViewController: UICollectionViewController {
    
    class DKImageCollectionCell: UICollectionViewCell {
        var thumbnail: UIImage! {
            didSet {
                self.imageView.image = thumbnail
            }
        }
        
        override var selected: Bool {
            didSet {
                checkView.hidden = !super.selected
            }
        }
        
        private var imageView = UIImageView()
        
        private lazy var checkView: UIImageView = {
            let imageData = NSData(bytesNoCopy: UnsafeMutablePointer<Void>(DKImagePickerControllerResource.selectedImage), length: DKImagePickerControllerResource.selectedImage.count, freeWhenDone: false)
            var image = UIImage(data: imageData)
            let center = image!.size.width / 2
            image = image?.resizableImageWithCapInsets(UIEdgeInsets(top: center, left: center, bottom: center, right: center))
            let imageView = UIImageView(image: image)
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            imageView.frame = self.bounds
            self.contentView.addSubview(imageView)
            self.contentView.addSubview(checkView)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            imageView.frame = self.bounds
            checkView.frame = imageView.frame
        }
    }
    
    lazy private var groups = [DKAssetGroup]()
    
    lazy var selectGroupButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: "selectGroup", forControlEvents: .TouchUpInside)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.titleLabel!.font = UIFont.boldSystemFontOfSize(16.0)
        return button
    }()
    
    lazy private var library: ALAssetsLibrary = {
        return ALAssetsLibrary()
    }()
    
    var selectedAssetGroup: DKAssetGroup!
    private lazy var imageAssets: NSMutableArray = {
        return NSMutableArray()
    }()
    
    lazy var selectGroupVC: DKAssetGroupVC = {
        var groupVC = DKAssetGroupVC()
        groupVC.selectedGroupBlock = {(assetGroup: DKAssetGroup) in
            self.selectAssetGroup(assetGroup)
        }
        return groupVC
    }()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        
        let interval: CGFloat = 3
        layout.minimumInteritemSpacing = interval
        layout.minimumLineSpacing = interval
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let itemWidth = (screenWidth - interval * 3) / 4
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)

        self.init(collectionViewLayout: layout)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.collectionView!.allowsMultipleSelection = true
        self.collectionView!.registerClass(DKImageCollectionCell.self, forCellWithReuseIdentifier: ImageCellIdentifier)
        
        self.library.enumerateGroupsWithTypes(ALAssetsGroupAll, usingBlock: {(group: ALAssetsGroup! , stop: UnsafeMutablePointer<ObjCBool>) in
            if group != nil {
                if group.numberOfAssets() != 0 {
                    let groupName = group.valueForProperty(ALAssetsGroupPropertyName) as! String

                    let assetGroup = DKAssetGroup()
                    assetGroup.groupName = groupName
                    assetGroup.thumbnail = UIImage(CGImage: group.posterImage().takeUnretainedValue())
                    assetGroup.group = group
                    self.groups.insert(assetGroup, atIndex: 0)
                }
            } else {
                if let assetGroup = self.groups.first {
                    self.selectAssetGroup(assetGroup)
                }
                
                self.selectGroupButton.enabled = self.groups.count > 1
            }
        }, failureBlock: {(error: NSError!) in
                //                self.noAccessView.frame = self.view.bounds
                //                self.tableView.scrollEnabled = false
                //                self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
                //                self.view.addSubview(self.noAccessView)
        })
    }
    
    func selectAssetGroup(assetGroup: DKAssetGroup) {
        self.selectedAssetGroup = assetGroup
        self.title = selectedAssetGroup.groupName
        
        self.imageAssets.removeAllObjects()
        
        assetGroup.group.enumerateAssetsWithOptions(.Reverse) {[unowned self](result: ALAsset!, index: Int, stop: UnsafeMutablePointer<ObjCBool>) in
            if result != nil {
                let asset = DKAsset()
                asset.thumbnailImage = UIImage(CGImage:result.thumbnail().takeUnretainedValue())
                asset.url = result.valueForProperty(ALAssetPropertyAssetURL) as? NSURL
                asset.originalAsset = result
                self.imageAssets.addObject(asset)
            } else {
                self.collectionView!.reloadData()
                self.collectionView?.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
            }
        }
        
        self.selectGroupButton.setTitle(self.selectedAssetGroup.groupName + (self.groups.count > 1 ? "  \u{25be}" : "" ), forState: .Normal)
        self.selectGroupButton.sizeToFit()
        self.navigationItem.titleView = self.selectGroupButton
    }
    
    func selectGroup() {
        self.selectGroupVC.groups = groups
        
        FBPopoverViewController.popoverViewController(self.selectGroupVC, fromView: self.selectGroupButton)
    }
    
    //Mark: - UICollectionViewDelegate, UICollectionViewDataSource methods
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageAssets.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ImageCellIdentifier, forIndexPath: indexPath) as! DKImageCollectionCell
        
        let asset = imageAssets[indexPath.row] as! DKAsset
        cell.thumbnail = asset.thumbnailImage
        
        if find(self.imagePickerController!.selectedAssets, asset) != nil {
            cell.selected = true
            collectionView.selectItemAtIndexPath(indexPath, animated: false, scrollPosition: UICollectionViewScrollPosition.None)
        } else {
            cell.selected = false
            collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.imagePickerController!.selectedAssets.count < self.imagePickerController!.maxSelectableCount
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName(DKImageSelectedNotification, object: imageAssets[indexPath.row])
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName(DKImageUnselectedNotification, object: imageAssets[indexPath.row])
    }
}

//////////////////////////////////////////////////////////////////////////////////////////
// MARK: - Main Controller
//////////////////////////////////////////////////////////////////////////////////////////

public class DKImagePickerController: UINavigationController {
    
    public var rightButtonTitle: String = "Select"
    public var maxSelectableCount = 999
    /// Displayed when denied access
    public lazy var noAccessView: UIView = {
        let label = UILabel()
        label.text = "User has denied access"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.lightGrayColor()
        return label
    }()
    
    public weak var pickerDelegate: DKImagePickerControllerDelegate?
    public var defaultSelectedAssets: [DKAsset]? {
        didSet {
            if let defaultSelectedAssets = self.defaultSelectedAssets {
                self.selectedAssets = defaultSelectedAssets
//                self.imagesPreviewView.replaceAssets(defaultSelectedAssets)
                self.updateSelectionStatus()
            }
        }
    }
    
    var selectedAssets = [DKAsset]()
    
    lazy internal var doneButton: UIButton = {
        let button = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        button.setTitle("", forState: UIControlState.Normal)
        button.setTitleColor(self.navigationBar.tintColor, forState: UIControlState.Normal)
        button.reversesTitleShadowWhenHighlighted = true
        button.addTarget(self, action: "onDoneClicked", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }()
    
    public convenience init() {
        self.init(rootViewController: DKImageGroupViewController())
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "selectedImage:",
                                                                   name: DKImageSelectedNotification,
                                                                 object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "unselectedImage:",
                                                                   name: DKImageUnselectedNotification,
                                                                 object: nil)
    }

    override public func pushViewController(viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)

        self.topViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.doneButton)
        self.updateSelectionStatus()
        
        if self.viewControllers.count == 1 && self.topViewController?.navigationItem.leftBarButtonItem == nil {
            self.topViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel,
                target: self,
                action: "onCancelClicked")
        }
    }
    
    private func updateSelectionStatus() {
        if self.selectedAssets.count > 0 {
            self.doneButton.setTitle(rightButtonTitle + "(\(selectedAssets.count))", forState: UIControlState.Normal)
        } else {
            self.doneButton.setTitle("", forState: UIControlState.Normal)
        }
        self.doneButton.sizeToFit()
    }
    
    // MARK: - Delegate methods
    func onCancelClicked() {
        if let delegate = self.pickerDelegate {
            delegate.imagePickerControllerCancelled()
        }
    }
    
    func onDoneClicked() {
        if let delegate = self.pickerDelegate {
            delegate.imagePickerControllerDidSelectedAssets(self.selectedAssets)
        }
    }
    
    // MARK: - Notifications
    func selectedImage(noti: NSNotification) {
        if let asset = noti.object as? DKAsset {
            selectedAssets.append(asset)
//            imagesPreviewView.insertAsset(asset)
            updateSelectionStatus()
        }
    }
    
    func unselectedImage(noti: NSNotification) {
        if let asset = noti.object as? DKAsset {
            selectedAssets.removeAtIndex(find(selectedAssets, asset)!)
//            imagesPreviewView.removeAsset(asset)
            updateSelectionStatus()
        }
    }
}
