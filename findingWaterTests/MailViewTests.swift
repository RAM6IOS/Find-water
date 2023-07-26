//
//  MailViewTests.swift
//  findingWaterTests
//
//  Created by Ramzi Bouchedoub on 26/7/2023.
//

import XCTest
@testable import findingWater

class MailViewTests: XCTestCase {
    func testMakeUIViewController() {
        // Create a MailView instance with sample content, recipient, and subject.
        let mailView = MailView(content: "Sample content", to: "example@example.com", subject: "Sample Subject")
        
        // Get the MFMailComposeViewController from the MailView instance.
        let mailComposeViewController = mailView.makeUIViewController(context: .init())
        
        // Perform assertions to ensure that the MFMailComposeViewController is correctly configured.
        // We can only check if the view controller is not nil because we can't fully test its behavior.
        XCTAssertNotNil(mailComposeViewController, "MFMailComposeViewController should not be nil")
        XCTAssertEqual(mailComposeViewController.recipients?.first, "example@example.com")
        XCTAssertEqual(mailComposeViewController.subject, "Sample Subject")
        XCTAssertEqual(mailComposeViewController.messageBody, "Sample content")
    }
}
