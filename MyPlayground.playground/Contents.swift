import UIKit

/*
함수와 클로저 만들기 (xcode - 플레이그라운드)
- 함수
    함수명 : printWithFunction
    매개변수 : Int값 number
    반환값 : 함수에 입력된 숫자는 (입력된 매개변수값))입니다.
- 클로저
    위의 함수를 클로저로 만들기
    반환값만 "함수에" -> "클로저에"로 변경
}
 
이정인(iOS_9기)
*/

// 함수
func printWriteFunction(number: Int) -> String {
    return "함수에 입력된 숫자는 \(number)입니다."
}

print(printWriteFunction(number: 10))



// 클로저
func printWriteClosure(closure: () -> Void) {
    var number: Int = 10
    
    print("클로저에 입력된 숫자는 \(number)입니다.")
}

printWriteClosure {
    
}
