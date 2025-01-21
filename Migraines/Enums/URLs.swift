//
//  URLs.swift
//  Migraines
//
//  Created by MZiO on 21/01/25.
//

import Foundation

/// A collection of static URLs used throughout the application.
///
/// This enum contains various URLs that are utilized for different purposes,
/// such as contacting support, accessing the privacy policy, reviewing terms of use,
/// and writing reviews on the App Store.
enum URLs {
    
    static let email = URL(string: "mailto:mziodev@gmail.com")!
    
    static let privacyPolicy = URL(
        string: "https://mziodev.github.io/apps/Migraines/privacy-policy.html"
    )!
    
    static let termsOfUse = URL(
        string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/"
    )!
    
    static let writeReview = URL(
        string: "itms-apps://itunes.apple.com/app/id6739422803?action=write-review"
    )!
}
