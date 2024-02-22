//
//  AppDelegate.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/3/3.
//  Copyright © 2017 Contextual.
//

import UIKit
import ContextualSDK
import GuideBlocks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /**
         Registers the contextual library.

         This method is responsible for registering the Contextual library in the app delegate.

         - Parameter None
         - Returns: None
         */
        self.registerContextual()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AirbnbMainController()        
        window?.makeKeyAndVisible()
        return true
    }

    private func registerContextual() {
        let appKey = "Amr_Test8988589"
        
        Contextual.sharedInstance().registerGuideBlock(MultiSelectSurveyGuideController(), forKey: "MultiSelectSurvey")
        Contextual.sharedInstance().registerGuideBlock(AdhocRowInsertion(), forKey: "AdhocRowInsertion")
        Contextual.sharedInstance().registerGuideBlock(FancyAnnouncementGuide(), forKey: "FancyAnnouncement")
        Contextual.sharedInstance().registerGuideBlock(AppFieldEditGuide.sharedInstance, forKey: "AppFieldEdit")
        Contextual.sharedInstance().registerGuideBlock(ConfettiGuide(), forKey: "Confetti")
        Contextual.sharedInstance().registerGuideBlock(CircleVideoGuide(), forKey: "CircleVideo")

        Contextual.sharedInstance().registerGuideBlock(
            openChecklistGuideController.openChecklistGuide,
            forKey: "OpenChecklist"
        )
        Contextual.sharedInstance().registerGuideBlock(
            qrCodeGuideController.qrCodeGuide,
            forKey: "QRCode"
        )
        
        Contextual.sharedInstance().registerInstall(
            forApp: appKey,
            withDebugMode: true
        ) {
            let createdTime = ctxFormatDate(Date())
            Contextual.sharedInstance().tagUserId("airbnb-demo \(createdTime ?? "")")
        }
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "airbnbContextual" {
            print("got deeplink url: \(url)")
            if let airbnbMainController = window?.rootViewController as? AirbnbMainController {
                if airbnbMainController.handle(deepLink: url.absoluteString) {
                    print("deepLink handled successfully")
                } else {
                    print("deepLink failed to be handled")
                }
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
