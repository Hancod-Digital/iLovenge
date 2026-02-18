import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var shareFileChannel: FlutterMethodChannel?
  private var pendingSharedFilePath: String?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let url = launchOptions?[.url] as? URL {
      _ = handleIncomingSharedFile(url)
    }

    GeneratedPluginRegistrant.register(with: self)
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    setupShareFileChannelIfNeeded()
    return result
  }

  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
    setupShareFileChannelIfNeeded()

    if handleIncomingSharedFile(url) {
      return true
    }

    return super.application(app, open: url, options: options)
  }

  private func setupShareFileChannelIfNeeded() {
    guard shareFileChannel == nil else { return }
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return
    }

    shareFileChannel = FlutterMethodChannel(
      name: "ilovenge/share_file",
      binaryMessenger: controller.binaryMessenger
    )

    shareFileChannel?.setMethodCallHandler { [weak self] call, result in
      guard let self else {
        result(nil)
        return
      }

      switch call.method {
      case "getInitialSharedFilePath":
        result(self.pendingSharedFilePath)
        self.pendingSharedFilePath = nil
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  private func handleIncomingSharedFile(_ url: URL) -> Bool {
    guard url.isFileURL else { return false }

    let copiedFilePath = copySharedFileToTemp(url) ?? url.path

    // If channel is ready, deliver immediately and avoid replaying on next startup.
    if let channel = shareFileChannel {
      channel.invokeMethod("onSharedFilePath", arguments: copiedFilePath)
      pendingSharedFilePath = nil
    } else {
      // Channel is not ready (cold launch), keep it for getInitialSharedFilePath.
      pendingSharedFilePath = copiedFilePath
    }

    return true
  }

  private func copySharedFileToTemp(_ url: URL) -> String? {
    let hasSecurityScope = url.startAccessingSecurityScopedResource()
    defer {
      if hasSecurityScope {
        url.stopAccessingSecurityScopedResource()
      }
    }

    let tempDirectory = FileManager.default.temporaryDirectory
      .appendingPathComponent("incoming_share", isDirectory: true)
    do {
      try FileManager.default.createDirectory(at: tempDirectory, withIntermediateDirectories: true)

      let destinationURL = tempDirectory
        .appendingPathComponent("\(UUID().uuidString)-\(url.lastPathComponent)")
      if FileManager.default.fileExists(atPath: destinationURL.path) {
        try FileManager.default.removeItem(at: destinationURL)
      }

      try FileManager.default.copyItem(at: url, to: destinationURL)
      return destinationURL.path
    } catch {
      return nil
    }
  }
}
