//for i in 2...9 {
//    for j in 1...9 {
//        print("\(i) X \(j) = \(i * j)")
//    }
//}


func printBlank() {
    print(" ", terminator: "")
}

func printStar() {
    print("*", terminator: "")
}

func printTriangle(totalLines: Int) {
    for currentLine in 1 ... totalLines {
        let whiteSpaceCount = totalLines - currentLine + 1
        let starCount = ((currentLine - 1) * 2) + 1

        for _ in 1 ... whiteSpaceCount {
            printBlank()
        }

        for _ in 1 ... starCount {
            printStar()
        }

        for _ in 1 ... whiteSpaceCount {
            printBlank()
        }
        print()
    }
}

printTriangle(totalLines: 12)
