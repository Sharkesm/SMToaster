import XCTest
import SMToaster

class SMToasterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testInit() {
        
        let rect = CGRect(x: 50, y: 50, width: 200, height: 300)
        
        let toaster = SMToaster(frame: rect)
        
        XCTAssert(toaster.frame == rect)
        XCTAssert(toaster.frame.size == rect.size)
    }
    
    
    func testInvalidInit() {
        let rect = CGRect(x: 50, y: 50, width: 200, height: 300)
        let incorrectRect = CGRect(x: 100, y: 100, width: 500, height: 200)
        
        let toaster = SMToaster(frame: rect)
        
        XCTAssertFalse(toaster.frame == incorrectRect)
        XCTAssertFalse(toaster.frame.size == incorrectRect.size)
    }
    
    
    func testInitWithDefaultParams() {
        let title = "Toast title"
        let message = "Toast message"
        
        let toaster = SMToaster(title: nil, message: nil)
        toaster.title = title
        toaster.message = message
        
        XCTAssertEqual(toaster.title, title)
        XCTAssertEqual(toaster.message, message)
    }
    
    func testInitWithValidParams() {
        let title = "Title"
        let message = "Message"
        
        let toaster = SMToaster(title: title, message: message)
        
        XCTAssertEqual(toaster.title, title)
        XCTAssertEqual(toaster.message, message)
    }
    
    
    func testInitWithInvalidParams() {
        let title = "Title"
        let message = "Message"
        
        let toaster = SMToaster(title: title, message: message)
        
        XCTAssertNotEqual(toaster.title, "Hello")
        XCTAssertNotEqual(toaster.message, "Hello world")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
