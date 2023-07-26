//
//  findingWaterTests.swift
//  findingWaterTests
//
//  Created by Ramzi Bouchedoub on 25/7/2023.
//

import XCTest
@testable import findingWater


/*
class MockFirestore: FirestoreProtocol {
    var mockSources: [Sources]

    init(mockSources: [Sources]) {
        self.mockSources = mockSources
    }

    func fetchWaterSourcesFromFirestore(completion: @escaping ([Sources]) -> Void) {
        // Simulate the Firestore response by returning the mockSources array.
        completion(mockSources)
    }
}
 */
/*
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
*/
/*
final class FindingWaterTests: XCTestCase {
    var locationMapVM: LocationMapViewModel!

    override func setUp() {
        super.setUp()
        
        // Create a mock Sources object.
        let mockSources = [Sources(id: "12345",
                                   name: "Water Source",
                                   latitude: 1.2345,
                                   longitude: 2.3456)]

        // Create a mock Firestore instance with the mockSources data.
        let mockFirestore = MockFirestore(mockSources: mockSources)

        // Create a LocationMapViewModel instance with the mock Firestore instance.
        locationMapVM = LocationMapViewModel(firestore: mockFirestore)
    }

    override func tearDown() {
        locationMapVM = nil
        super.tearDown()
    }

    func testFetchDataWaterSource() {
        // Call the fetchDataWaterSource function on the LocationMapViewModel instance.
        locationMapVM.fetchDataWaterSource {
            // This block is called when the data is fetched and processed

            // Assert that the viewModel's source array contains the mock Sources object.
            XCTAssertEqual(self.locationMapVM.source.count, 1)
            XCTAssertEqual(self.locationMapVM.source.first?.id, "12345")
            XCTAssertEqual(self.locationMapVM.source.first?.name, "Water Source")
            XCTAssertEqual(self.locationMapVM.source.first?.latitude, 1.2345)
            XCTAssertEqual(self.locationMapVM.source.first?.longitude, 2.3456)
        }
    }
}



 class MockFirestore: Firestore {
 func collection(_ collectionPath: String) -> CollectionReference {
 return MockCollectionReference()
 }
 }
 
 class MockCollectionReference: CollectionReference {
 func addSnapshotListener(_ listener: @escaping (QuerySnapshot?, Error?) -> Void) {
 listener(nil, nil)
 }
 }
/*
 final class FindingWaterTests: XCTestCase {
 var locationMapVM: MockFirestore!
 
 override func setUp() {
 super.setUp()
 locationMapVM = MockFirestore()
 }
 override func tearDown() {
 locationMapVM  = nil
 }
 
 /*
  override func setUpWithError() throws {
  // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  */
 func testFetchDataWaterSource() {
 // Create a mock Firebase Firestore instance.
 let mockFirestore = MockFirestore()
 // Create a mock Sources object.
 let mockSources = Sources(
 id: "12345",
 name: "Water Source",
 latitude: 1.2345,
 longitude: 2.3456
 )
 
 // Set the mock Firestore to return the mock Sources object.
 mockFirestore.collection("sources").addSnapshotListener { (querySnapshot, error) in
 guard let documents = querySnapshot?.documents else {
 print("No documents")
 return
 }
 
 // Assert that the mock Sources object is returned.
 XCTAssertEqual(documents.compactMap { (queryDocumentSnapshot) -> Sources? in
 return try? queryDocumentSnapshot.data(as: Sources.self)
 }.first, mockSources)
 }
 
 // Create a LocationMapViewModel instance and pass in the mock Firebase Firestore instance.
 let viewModel = LocationMapViewModel(firestore: mockFirestore)
 
 // Assert that the viewModel's source array contains the mock Sources object.
 XCTAssertEqual(viewModel.source.count, 1)
 XCTAssertEqual(viewModel.source.first?.id, "12345")
 XCTAssertEqual(viewModel.source.first?.name, "Water Source")
 XCTAssertEqual(viewModel.source.first?.latitude, 1.2345)
 XCTAssertEqual(viewModel.source.first?.longitude, 2.3456)
 }
 /*
  override func tearDownWithError() throws {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  */
 /*
  func testExample() throws {
  // This is an example of a functional test case.
  // Use XCTAssert and related functions to verify your tests produce the correct results.
  // Any test you write for XCTest can be annotated as throws and async.
  // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
  // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
  }
  */
 }
 */
*/
