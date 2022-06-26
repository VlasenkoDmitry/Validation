import XCTest
@testable import task4_test

class task4_testTests: XCTestCase {

    var validator: Validator!
    var login = String()
    var expectation = Bool()
    var result = Bool()
    

    override func setUpWithError() throws {
        validator = Validator()
        result = Bool()
    }

    override func tearDownWithError() throws {
        validator = nil
    }
    
    // MARK: - Private tests
    
    func testTooShortLogin() throws {
        // Given
        login = "12"
        expectation = false
        // When
        if Rules.wordLength.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMinRequiredLengthLogin() throws {
        // Given
        login = "Cat"
        expectation = true
        // When
        if Rules.wordLength.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMaxRequiredLengthLogin() throws {
        // Given
        login = "14159265358979323846264338327950"
        expectation = true
        // When
        if Rules.wordLength.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testTooLongLogin() throws {
        // Given
        login = "Крунг Теп Маха Накорн Амон Раттанакосин Маханиндра Аюттая Махадилок Поп Нопрарат Ратчатани Буриром Удомратнивет Амонпиман Аватансатип Сапкакатия Висануккампасит"
        expectation = false
        // When
        if Rules.wordLength.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailWithoutPoint() throws {
        // Given
        login = "hello@mailru"
        expectation = true
        // When
        if Rules.validEmail.check(login) == nil {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidCharacters() throws {
        // Given
        login = "he*llo@mail.ru"
        expectation = false
        // When
        if Rules.validEmail.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidDomen() throws {
        // Given
        login = "hello@mail.r"
        expectation = false
        // When
        if Rules.validEmail.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectEmail() throws {
        // Given
        login = "hello@mail.ru"
        expectation = true
        // When
        if Rules.validEmail.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testInvalidFirstLetterNickname() throws {
        // Given
        login = "_0_"
        expectation = false
        // When
        if Rules.firstLetterNickname.check(login) == nil {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectFirstLetterNickname() throws {
        // Given
        login = "0_0"
        expectation = true
        // When
        if Rules.firstLetterNickname.check(login) == nil {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectNickname() throws {
        // Given
        login = "qwerty"
        expectation = true
        // When
        if Rules.fullFormatNickname.check(login) == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    // MARK: - Common tests

    func testNotEmptyLoginCommon() throws {
        // Given
        login = "qweasdzxc"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == true, validation.error == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testTooShortLoginCommon() throws {
        // Given
        login = "W"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .incorrectLengthLogin {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMinRequiredLengthLoginCommon() throws {
        // Given
        login = "Dog"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == true, validation.error == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMaxRequiredLengthLoginCommon() throws {
        // Given
        login = "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwq"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == true, validation.error == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testTooLongLoginCommon() throws {
        // Given
        login = "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqqwqwqwqwwqwqwqwqwqwqw"
        expectation = false
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .incorrectLengthLogin {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailWithoutAtLoginCommon() throws {
        // Given
        login = "4hellomail.ru"
        expectation = false
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidFirstLetterNickname {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailWithoutPointLoginCommon() throws {
        // Given
        login = "hello@mailru"
        expectation = false
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidEmail {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidCharactersCommon() throws {
        // Given
        login = "he*llo@mail.ru"
        expectation = false
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidEmail {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidDomenCommon() throws {
        // Given
        login = "hello@mail.r"
        expectation = false
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidEmail {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectEmailCommon() throws {
        // Given
        login = "hello@mail.ru"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == true, validation.error == nil  {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testInvalidFirstLetterNicknameCommon() throws {
        // Given
        login = "_0_"
        expectation = false
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidNickname {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectFirstLetterNicknameCommon() throws {
        // Given
        login = "0_0"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == true, validation.error == nil  {
            result = true
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectNicknameCommon() throws {
        // Given
        login = "qwerty"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == true, validation.error == nil  {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }
    
    
    
    // MARK: - Private tests chain responsibility
    
    func testTooShortLoginCR() throws {
        // Given
        login = "12"
        expectation = false
        // When
        if RulesChainResponsibility.wordLength.check(login) == false {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMinRequiredLengthLoginCR() throws {
        // Given
        login = "Cat"
        expectation = true
        // When
        if RulesChainResponsibility.wordLength.check(login) == true {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMaxRequiredLengthLoginCR() throws {
        // Given
        login = "14159265358979323846264338327950"
        expectation = true
        // When
        if RulesChainResponsibility.wordLength.check(login) == true {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testTooLongLoginCR() throws {
        // Given
        login = "Крунг Теп Маха Накорн Амон Раттанакосин Маханиндра Аюттая Махадилок Поп Нопрарат Ратчатани Буриром Удомратнивет Амонпиман Аватансатип Сапкакатия Висануккампасит"
        expectation = false
        // When
        if RulesChainResponsibility.wordLength.check(login) == false {
            result = false
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailWithoutPointCR() throws {
        // Given
        login = "hello@mailru"
        expectation = false
        // When
        if RulesChainResponsibility.validEmail.check(login) == false {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidCharactersCR() throws {
        // Given
        login = "he*llo@mail.ru"
        expectation = false
        // When
        if RulesChainResponsibility.validEmail.check(login) == false {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidDomenCR() throws {
        // Given
        login = "hello@mail.r"
        expectation = false
        // When
        if RulesChainResponsibility.validEmail.check(login) == false {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectEmailCR() throws {
        // Given
        login = "hello@mail.ru"
        expectation = true
        // When
        if RulesChainResponsibility.validEmail.check(login) == true {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testInvalidFirstLetterNicknameCR() throws {
        // Given
        login = "_0_"
        expectation = false
        // When
        if RulesChainResponsibility.firstLetterNickname.check(login) == false {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectFirstLetterNicknameCR() throws {
        // Given
        login = "0_0"
        expectation = true
        // When
        if RulesChainResponsibility.firstLetterNickname.check(login) == true {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectNicknameCR() throws {
        // Given
        login = "qwerty"
        expectation = true
        // When
        if RulesChainResponsibility.fullFormatNickname.check(login) == true {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }
    
    // MARK: - Common tests chain responsibility
    
    func testNotEmptyLoginCommonCR() throws {
        // Given
        login = "qweasdzxc"
        expectation = true
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == true, resultValidation.error == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testTooShortLoginCommonCR() throws {
        // Given
        login = "W"
        expectation = true
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == false, resultValidation.error == .incorrectLengthLogin {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMinRequiredLengthLoginCommonCR() throws {
        // Given
        login = "Dog"
        expectation = true
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == true, resultValidation.error == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testMaxRequiredLengthLoginCommonCR() throws {
        // Given
        login = "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwq"
        expectation = true
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == true, resultValidation.error == nil {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testTooLongLoginCommonCR() throws {
        // Given
        login = "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqqwqwqwqwwqwqwqwqwqwqw"
        expectation = false
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == false, resultValidation.error == .incorrectLengthLogin {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailWithoutAtLoginCommonCR() throws {
        // Given
        login = "4hellomail.ru"
        expectation = false
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == false, resultValidation.error == .invalidFirstLetterNickname {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailWithoutPointLoginCommonCR() throws {
        // Given
        login = "hello@mailru"
        expectation = false
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == false, resultValidation.error == .invalidEmail {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidCharactersCommonCR() throws {
        // Given
        login = "he*llo@mail.ru"
        expectation = false
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == false, resultValidation.error == .invalidEmail {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidDomenCommonCR() throws {
        // Given
        login = "hello@mail.r"
        expectation = false
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == false, resultValidation.error == .invalidEmail {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectEmailCommonCR() throws {
        // Given
        login = "hello@mail.ru"
        expectation = true
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == true, resultValidation.error == nil  {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testInvalidFirstLetterNicknameCommonCR() throws {
        // Given
        login = "_0_"
        expectation = false
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == false, resultValidation.error == .invalidNickname {
            result = false
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectFirstLetterNicknameCommonCR() throws {
        // Given
        login = "0_0"
        expectation = true
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == true, resultValidation.error == nil {
            result = true
        } else {
            result = true
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testCorrectNicknameCommonCR() throws {
        // Given
        login = "qwerty"
        expectation = true
        let validation = ValidationChainResponsibility(text: login)
        // When
        let resultValidation = validation.start()
        if resultValidation.result == true, resultValidation.error == nil  {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }
    
}
