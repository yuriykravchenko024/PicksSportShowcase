import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "bg")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
    }
    
    
    func openApp() {
        DispatchQueue.main.async {
            let hostingController = UIHostingController(rootView: AppRoot())
            self.setRootViewController(hostingController)
        }
    }
    
    func openWeb(stringURL: String) {
        DispatchQueue.main.async {
            let webView = PrivacyPolicyViewController(url: stringURL)
            self.setRootViewController(webView)
        }
    }
    
    func setRootViewController(_ viewController: UIViewController) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController = viewController
        }
    }
}
