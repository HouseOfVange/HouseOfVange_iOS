struct PriceList {

    var prices: [Int] = []
    
    mutating func makePriceList(){
        for i in 1..<1415 {
            prices.append(i)
        }
        print(prices)
    }
}

