import Foundation

enum PaginationLoginError: String {
    case emptyLogin = "Empty login"
    case incorrectLengthLogin = "Min 3 Max 32 letters"
    case invalidEmail = "Must have valid email"
    case invalidNickname = "Must have valid first letter in nickname"
    case invalidFirstLetterNickname = "Must have valid nickname"
}
