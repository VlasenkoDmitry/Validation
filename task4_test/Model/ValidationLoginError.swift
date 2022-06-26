import Foundation

enum ValidationLoginError: String {
    case emptyLogin = "Empty login"
    case incorrectLengthLogin = "Min 3 Max 32 letters"
    case invalidEmail = "Must have valid email"
    case invalidNickname = "Must have valid nickname"
    case invalidFirstLetterNickname =  "Must have valid first letter in nickname"
    case unknownError = "Unknown error"
}
