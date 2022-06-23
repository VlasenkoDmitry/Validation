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
        if Rule.wordLength.check(login) == nil {
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
        if Rule.wordLength.check(login) == nil {
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
        if Rule.wordLength.check(login) == nil {
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
        if Rule.wordLength.check(login) == nil {
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
        if Rule.validEmail.check(login) == nil {
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
        if Rule.validEmail.check(login) == nil {
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
        if Rule.validEmail.check(login) == nil {
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
        if Rule.validEmail.check(login) == nil {
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
        if Rule.firstLetter.check(login) == nil {
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
        if Rule.firstLetter.check(login) == nil {
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
        if Rule.nickname.check(login) == nil {
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

    func testEmailWithoutAtLoginCommon() throws {
        // Given
        login = "4hellomail.ru"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidNickname {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailWithoutPointLoginCommon() throws {
        // Given
        login = "hello@mailru"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidEmail {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidCharactersCommon() throws {
        // Given
        login = "he*llo@mail.ru"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidEmail {
            result = true
        } else {
            result = false
        }
        //Then
        XCTAssertEqual(expectation, result)
    }

    func testEmailInvalidDomenCommon() throws {
        // Given
        login = "hello@mail.r"
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidEmail {
            result = true
        } else {
            result = false
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
        expectation = true
        // When
        let validation = validator.validate(login: login)
        if validation.result == false, validation.error == .invalidFirstLetterNickname {
            result = true
        } else {
            result = false
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
        if validation.result == false, validation.error == .invalidNickname {
            result = true
        } else {
            result = false
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
}
