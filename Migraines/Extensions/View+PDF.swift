//
//  View+PDF.swift
//  Migraines
//
//  Created by MZiO on 14/2/25.
//

import SwiftUI
import UIKit

extension View {
    
    func renderToPDF() -> Data? {
        let controller = UIHostingController(rootView: self)
        controller.view.backgroundColor = .white
        
        let window = UIWindow(
            frame: CGRect(origin: .zero, size: CGSize(width: 595, height: 842))
        )
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        controller.view.layoutIfNeeded()
        
        let renderer = UIGraphicsPDFRenderer(bounds: window.bounds)
        
        return renderer.pdfData { context in
            context.beginPage()
            window.layer.render(in: context.cgContext)
        }
    }
}
