import Darwin

//Enum example:-  https://www.youtube.com/watch?v=8ocSpsSlvJg
//Enum Example:- https://www.youtube.com/watch?v=CdBL7m1AeII


//ENUMERATIONS

var arrWeeks = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];

let strHumDay = arrWeeks[0].uppercased() // String capitalization

enum DaysOfWeek:String{
    case sunday, monday, tuesday, wednesday, thursday, friday, satursday
    
    func displayDay() -> String{
        return self.rawValue.uppercased()
    }
}

// 1. Raw value concept in enum

//let enumHumpDay = DaysOfWeek.sunday// raw value not working, need to define type in with enum

let enumHumpDay = DaysOfWeek.sunday.rawValue.uppercased() // Now raw value option availabel


// 2. Function in enum
let today = DaysOfWeek.friday
print("2." + today.displayDay())


//3. Switch with Enum

func whatToDo(day:DaysOfWeek) -> String {
   
    switch (day){
        
    case .sunday:
        return "Going to temple"
    case .monday:
        return "Going for work"
    case .tuesday:
        return "Dream for weekend"
    case .wednesday:
        return "We are getting there."
    case .thursday:
        return "One day more"
    case .friday:
        return "Pay day"
    case .satursday:
       return "Have a bear"
    }
}

let task = whatToDo(day: .tuesday)
print("3." + task )

func isWeekend(day:DaysOfWeek) -> Bool{
    switch(day){
    case .sunday, .satursday:
        return true
    default:
        return false
        
    }
}

print("3. IsWeekend: \(isWeekend(day: .sunday))")



//4. Diffrent raw values for each enum case

enum NumbersCase:Int, CaseIterable{
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    
}

print("4. Auto increment of raw value for Int/double :\(NumbersCase.five.rawValue)")



//5. Enum in collection with CaseIterable protocole

NumbersCase.allCases.map { print("5. Cases: \( $0 )")}








//6. Enum with associated values

enum FoodType{
    case Veg
    case NonVeg
}

enum Activity{
    case sleep
    case game(name:String)
    case run(disdatceInKm:Int)
    case eat(food:String, type:FoodType)
}

struct Activities{
    var morning:Activity
    var afternoon:Activity
    var evening:Activity
}

let JonnyActivity:Activities = Activities(morning: .run(disdatceInKm: 10), afternoon: .game(name: "PUBG"), evening: .eat(food: "Pasta", type: .Veg))























