//
//  GameViewController.swift
//  SpaceEvaders
//
//  Created by Tristen Miller on 12/24/14.
//  Copyright (c) 2014 Tristen Miller. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class GameViewController: UIViewController, ADBannerViewDelegate {
    var gameCenter: GameCenter!
    var adBannerView: ADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MainMenuScene(vc: self, size:CGSize(width: 2048, height: 1536))
        let skView = self.view as SKView
        self.gameCenter = GameCenter(rootViewController: self)
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
        loadAds()
        addAd()
    }
    
    func loadAds() {
        adBannerView = ADBannerView(frame: CGRectMake(0, 0, view.bounds.size.width, 32))
        adBannerView.center = CGPoint(x: adBannerView.center.x, y: view.bounds.size.height - adBannerView.frame.size.height / 2)
        adBannerView.delegate = self
        adBannerView.hidden = true
    }
    
    override func prefersStatusBarHidden() -> Bool  {
        return true
    }
    
    func openGC() {
        gameCenter.showGameCenter()
    }
    
    func addAd() {
        view.addSubview(adBannerView)
    }
    
    func removeAd() {
        adBannerView.removeFromSuperview()
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewWillLoadAd")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        self.adBannerView.hidden = false
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        NSLog("bannerViewActionShouldBegin")
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("bannerView")
    }

}
