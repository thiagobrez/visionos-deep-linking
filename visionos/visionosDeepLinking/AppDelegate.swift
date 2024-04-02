import UIKit
import React
import React_RCTAppDelegate

class AppDelegate: RCTAppDelegate {
  override func sourceURL(for bridge: RCTBridge) -> URL? {
    self.bundleURL()
  }

  func bundleURL() -> URL? {
#if DEBUG
    RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index")
#else
    Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
  }

  // Deep Links
  override func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
      print("============= Deep Link called")
      return RCTLinkingManager.application(application, open: url, options: options)
  }

  // Universal Links
  override func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
      print("============= Universal Link called")
      return RCTLinkingManager.application(application, continue: userActivity, restorationHandler: restorationHandler)
  }
}
