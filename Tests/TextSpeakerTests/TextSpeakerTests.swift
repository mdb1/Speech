import XCTest
@testable import TextSpeaker

final class SpeakerTests: XCTestCase {
    func testSpeaking() {
        // Given
        let sut: SpeakingMock = SpeakingMock()
        let text = "Hi"
        let language = "en-US"

        // When
        sut.speak(text, language: language)

        // Then
        XCTAssertEqual(sut.receivedLanguage, language)
        XCTAssertEqual(sut.receivedText, text)
        XCTAssertEqual(sut.speakCalls, 1)
    }
}

final class SpeakingMock: TextSpeaking {
    var receivedText: String?
    var receivedLanguage: String?
    var speakCalls = 0
    func speak(_ text: String, language: String) {
        speakCalls += 1
        receivedText = text
        receivedLanguage = language
    }
}
