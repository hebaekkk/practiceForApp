//
//  AppDelegate.swift
//  addPhotoFromAlbum_practice
//
//  Created by BigHand on 2020/12/17.
//

import UIKit
import Photos
var allPhotos: PHFetchResult<PHAsset>? = nil
var photocount = Int()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //여기서 Signal ABRT 생긴다
//        PHPhotoLibrary.requestAuthorization { (status) in
//                                          switch status {
//                                          case .authorized:
//                                              print("Good to proceed")
//                                              let fetchOptions = PHFetchOptions()
//                                              allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
//                                              photocount = allPhotos?.count ?? 0
//                                          case .denied, .restricted:
//                                              print("Not allowed")
//                                          case .notDetermined:
//                                              print("Not determined yet")
//                                          case .limited:
//                                              print("Limited")
//                                          @unknown default:
//                                              print("error")
//                                          }
//
//                                      }
//
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

