func sayName(name: String) {
    print("\(name)님, 안녕하세요")
}

func sayName(name: String, num: Int, money: Float64) {
    print("\(name)님, 안녕하세요")
    print("오늘의 로또는 \(num) 입니다.")
    print("당신의 지갑에는 \(money)원이 있습니다.")
}

sayName(name: "이희진", num: 18938998, money: 1991293299)
