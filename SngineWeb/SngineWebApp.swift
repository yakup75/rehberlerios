import SwiftUI
import OneSignalFramework

@main
struct SngineWebApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    static let oneSignalAppId = "97260d23-8425-4dc3-8e79-bde79e7b77bf" // Store your OneSignal App ID here
    static var oneSignalUserId: String?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       // Remove this method to stop OneSignal Debugging
       // OneSignal.Debug.setLogLevel(.LL_VERBOSE)
        
       // OneSignal initialization
       OneSignal.initialize(AppDelegate.oneSignalAppId, withLaunchOptions: launchOptions)

       // Get OneSignal user ID
       AppDelegate.oneSignalUserId = OneSignal.User.pushSubscription.id;
       

       // requestPermission will show the native iOS notification permission prompt.
       OneSignal.Notifications.requestPermission({ accepted in
         print("User accepted notifications: \(accepted)")
       }, fallbackToSettings: true)

       return true
    }
}
