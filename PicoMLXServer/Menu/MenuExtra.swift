//
//  MenuExtra.swift
//  PicoMLXServer
//
//  Created by Ronald Mannak on 3/4/24.
//

import SwiftUI
import OSLog

struct MenuExtra: View {
    
    let logger = Logger(subsystem: "PicoMLXServer", category: "MenuExtra")
    
    @Environment(ServerController.self) private var serverController: ServerController
    @Environment(\.openWindow) var openWindow
    @Environment(\.openURL) var openURL
    @AppStorage("chatClientURL") private var chatClientURL = "pico://"
    
    var body: some View {
        
        ServerListMenu()
        
        Button("Open Chat client") {
            // TODO: make this a setting in Settings
            // Can we ad an optional link to the app store if app isn't installed?
            if let url = URL(string: chatClientURL) {
                openURL(url)
            }
        }
        
        Divider()
        
        SettingsLink()
            .keyboardShortcut(",", modifiers: .command)
        
        Button("Setup...") {
            NSApplication.show()
            openWindow(id: "setup")
        }
        
        Divider()
        
        Button("Stop all servers") {
            serverController.stopAllServers()
        }
        .keyboardShortcut(".", modifiers: .command)
        
        Button("Quit Pico MLX Server") {
            NSApplication.shared.terminate(nil)
        }
        .keyboardShortcut("q", modifiers: [.command])
    }
}

#Preview {
    MenuExtra()
}
