import XCTest
@testable import TextSpeaker
import AVFAudio

final class SpeakerTests: XCTestCase {
    func testSpeaking() {
        // Given
        let sut: SpeakingMock = SpeakingMock()
        let text = "Hi"
        let language = "en-US"
        let category: AVAudioSession.Category = .playAndRecord
        let options: AVAudioSession.CategoryOptions = .allowBluetooth

        // When
        sut.speak(text, language: language, audioSessionCategory: category, options: options)

        // Then
        XCTAssertEqual(sut.receivedLanguage, language)
        XCTAssertEqual(sut.receivedText, text)
        XCTAssertEqual(sut.speakCalls, 1)
        XCTAssertEqual(sut.receivedAudioSessionCategory, category)
        XCTAssertEqual(sut.receivedAudioSessionOptions, options)
    }
}

final class SpeakingMock: TextSpeaking {
    var receivedText: String?
    var receivedLanguage: String?
    var receivedAudioSessionCategory: AVAudioSession.Category?
    var receivedAudioSessionOptions: AVAudioSession.CategoryOptions?
    var speakCalls = 0
    func speak(
        _ text: String,
        language: String,
        audioSessionCategory: AVAudioSession.Category,
        options: AVAudioSession.CategoryOptions
    ) {
        speakCalls += 1
        receivedText = text
        receivedLanguage = language
        receivedAudioSessionCategory = audioSessionCategory
        receivedAudioSessionOptions = options
    }
    
    var isSpeakingCalls = 0
    func isSpeaking() -> Bool {
        isSpeakingCalls += 1
        return true
    }
}
