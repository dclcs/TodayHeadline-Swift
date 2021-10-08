//
//  SceneDelegate.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/4.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow.init(windowScene: windowScene)
        window?.frame = windowScene.coordinateSpace.bounds
        let tabbarController = UITabBarController()
        let gtNewsVC = GTNewsViewController()
        gtNewsVC.tabBarItem.title = "新闻"
        gtNewsVC.tabBarItem.image = #imageLiteral(resourceName: "page")
        gtNewsVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "page_selected")
        
        
        let gtNewsVC0 = GTVideoViewController()
        gtNewsVC0.tabBarItem.title = "视频"
        gtNewsVC0.tabBarItem.image = #imageLiteral(resourceName: "video")
        gtNewsVC0.tabBarItem.selectedImage = #imageLiteral(resourceName: "video_selected")
//        GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
        
//        GTRecommendViewController *recommendController = [[GTRecommendViewController alloc] init];
        
//        UIViewController *controller4 = [[UIViewController alloc] init];
//        controller4.view.backgroundColor = [UIColor greenColor];
//        controller4.tabBarItem.title = @"我的";
//        controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
//        controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
        
        // 将四个页面的 UIViewController 加入到 UITabBarController 之中
        tabbarController.setViewControllers([gtNewsVC, gtNewsVC0], animated: false)
//        [tabbarController setViewControllers: @[viewcontroller, videoController, recommendController, controller4]];
//        tabbarController.delegate = self;
//        UINavigationController *navigationcontroller = [[UINavigationController alloc]initWithRootViewController:tabbarController];
        let navigationController = UINavigationController.init(rootViewController: tabbarController)
        window?.rootViewController  = navigationController
//        self.window.rootViewController = navigationcontroller;
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

