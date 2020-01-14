var foxTeam = [String]()

func foxCount (numbers: Int) {
    for number in 1...numbers {
        let description = "여우 \(number)마리"
//        print(description)
        foxTeam.append(description)
    }
}

foxCount(numbers: 8)

for (index, fox) in foxTeam.enumerated() {
    print(index + 1, fox)
    
}

