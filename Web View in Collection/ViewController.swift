//
//  ViewController.swift
//  Web View in Collection
//
//  Created by Jure Zove on 06/05/15.
//  Copyright (c) 2015 Candy Code. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.flowLayout.itemSize = self.view.bounds.size
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WebViewCell", forIndexPath: indexPath) as! WebViewCell
        cell.webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.google.com/search?q=page+\(indexPath.row)")!))
        return cell
    }
    
    // Setting webview to nil, so the user doesn't see the old content
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        (cell as! WebViewCell).webView.loadRequest(NSURLRequest(URL: NSURL(string: "about:blank")!))
    }
    
    // Let's hide the status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

