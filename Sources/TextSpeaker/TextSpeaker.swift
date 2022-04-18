import AVFoundation

public protocol TextSpeaking: AnyObject {
    func speak(_ text: String, language: String)
    func isSpeaking() -> Bool
}

public final class TextSpeaker: TextSpeaking {
    // Create an instance of AVSpeechSynthesizer.
    lazy var speechSynthesizer = AVSpeechSynthesizer()
    
    public init() {}

    public func speak(_ text: String, language: String = "en-US") {
        // Create an instance of AVSpeechUtterance and pass in a String to be spoken.
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: text)
        // Specify the voice. It is explicitly set to English here.
        // But it will use the device default if not specified.
        speechUtterance.voice = AVSpeechSynthesisVoice(language: language)
        // Pass in the utterance to the synthesizer to actually speak.
        speechSynthesizer.speak(speechUtterance)
    }
    
    public func isSpeaking() -> Bool {
        return speechSynthesizer.isSpeaking
    }
}
