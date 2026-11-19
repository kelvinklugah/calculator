import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground

        let config = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        config.allowsInlineMediaPlayback = true

        webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
        webView.scrollView.bounces = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        if let htmlURL = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "App") {
            webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
        } else if let fallbackURL = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(fallbackURL, allowingReadAccessTo: fallbackURL.deletingLastPathComponent())
        }
    }
}
