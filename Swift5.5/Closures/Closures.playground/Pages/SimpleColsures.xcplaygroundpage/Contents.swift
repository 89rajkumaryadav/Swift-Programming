//: [Previous](@previous)

// URL:- https://www.youtube.com/watch?v=4-EvBzIT5Y0
// Escaping:- //https://www.youtube.com/watch?v=xiS5gJOIQxI
// Auto closure**// https://www.youtube.com/watch?v=ZP4pEHtndFE
//https://www.youtube.com/watch?v=sAT5eBX13P0
//Closures with Capture List // https://www.youtube.com/watch?v=GIy-qnGLpHU


import Foundation
import SwiftUI
import PlaygroundSupport


//Closure Expression
/*
 { (Pramater1, Prameter2) -> Return Type in
 
 //Code goes here
 
 }
 */


//  Closure declaration type

//1. Empity/ Without prams closure
var cloWithoutPrams: () -> () = {
    print("This is closure withou prams.")
  
}







//2. Closures with prams

var cloWithPrams: (String) -> () = { name in
    print("Your name is: \(name)");
}





//3. Closures with return

var getGreetings: (String) -> (String) = { name in
    
    return "\(name), You are most welcome."
}








//4. Closure without name of argument

var cloWithoutpramsName: (Int,Int) -> (Int) = {
    return $0 + $1
}






//5. Without return argument
var cloWithouReturn: (Int,Int) -> (Int) = { $0 + $1 }







//6. AutoClosure Closures

var printGretting = { (name:String) -> String in
    
    return "Hi! \(name)"
}










//7. Trailing closure as last argument
func printGretting(name:String,  CloAuto: () -> () ) {
    
   print("\(name), You are welcome.")
    CloAuto();
}


//printGretting(name: "John") {
//   print("Gretting completed.")
//}












//8. Multiple closure as function argument

func additionTwoNumber(addition:(Int,Int) -> Int, substruction:(Int,Int) -> Int, inputA:Int, inputB:Int ){
    
    let result:Int = addition(inputA, inputB)
    print("Addition:\(result)")
    
    let subs = substruction(inputA,inputB)
    print("Substration: \(subs)")
}



 /*additionTwoNumber(addition: { a, b in
    let add = a + b
    
    return add
 }, substruction:{ a, b -> Int in
     return a - b
 }, inputA: 8, inputB: 4)
*/












//9. Trailing closure: it means closure as last argument of function

func trailingClosure(a:Int, b:Int, multiply:(Int,Int) -> () ){
    multiply(a,b)
}

/*
trailingClosure(a: 12, b: 65) { a, b in
    print("Multiply: \(a * b)")
}
*/














//10 Escaping closure: it can outlive if function lifecycle is already done.
var arrClosure:[() -> ()] = []

func escapingClosure(comp:@escaping () -> ()){
    
    print("Escaping func called")
    arrClosure.append(comp)
}


escapingClosure {
    print("Escaping Closure called")
}

print("Going to call Closure....")
arrClosure[0]()






//11. AutoClosure- It will remove closure syntex when calling function
//An autoclosure is a closure that’s automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it. This syntactic convenience lets you omit braces around a function’s parameter by writing a normal expression instead of an explicit closure


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

//Without auto closure
func serve(customer customerProvider:() -> String ){
    print("Serving to: \(customerProvider())")
}

func serveWithAuto(customer customerProvider:@autoclosure() -> String ){
    print("Serving to: \(customerProvider())")
}

serve {
    customersInLine.remove(at: 0)
}

//With auto closure
//serveWithAuto(customer: <#T##String#>)

serveWithAuto(customer: customersInLine.remove(at: 1))


// Capturing Values


//12. //If you want an autoclosure that’s allowed to escape, use both the @autoclosure and @escaping attributes. The @escaping attribute is described above in Escaping Closures.

// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"




// 13. Capturing Values

//Closures with Capture List // https://www.youtube.com/watch?v=GIy-qnGLpHU

func closuresCaptureValue(firstName:String, lastName:String){
   
    
    
}



/*

//Closure

//Simple closure
var nameShow:() -> () = { print("Simple Closure:- Hi John Doe")}


//Closure with Single argument
var greetings:(String)->() = { name in  print("Hi \(name)")}

// Closure with multiple Argument
var jointTwoName:(String, String) -> () = { (firstName, lastName) in
    
    print("Your name is: \(firstName) \(lastName)");
}


// Closures with Return

//Option 1
var getSum1:(Int,Int) -> Int = { inputA, inputB in
    
    return inputA + inputB
}

//Option 2
var getSum2:(Int,Int) -> Int = { inputA, inputB in
    inputA + inputB
}

//Option 3
var getSum3:(Int, Int) -> Int = { $0 + $1 }




//Closure as a function prams/ Trailing closure

func doMathWith(a:Int, b:Int, PrintResult:(Int)->()) {
    
    print("Before result...........")
    PrintResult(a + b)
    print("After Result............")
}


//Escapping Closures

func SayHello(name:String, greeting:@escaping (String)->()){
    let uppder = name.uppercased()
    
    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
        greetings(uppder)
    }
   
}


// escapingClosure vs Non scapping closures

//Escapping

//put closure in arr

var arrClosures:[()->()] = []

func nonEscappingClosures(completion: () -> ()){
    
    print("Before call")
 //   arrClosures.append(completion) it will show error as it can not outlive.
    completion()
    print("After call")
}

func escappingClosures(completion:@escaping () -> ()){
    
    print("Before call escappingClosures")
    arrClosures.append(completion) // It will not show error as it can out live
    completion()
    print("After call escappingClosures")
}











//Function returning closures

func getTrainName(train:String) -> ()->(){
    
    let upper = train.uppercased()
    
    return{
        print("Your train name is :\(upper)")
    }
}

//Closures that captures a value

func getCounter() -> ()->() {
    var counter = 0;
    
    return {
        print("Counter is: \(counter)")
        counter += 1 ;
    }
    
}


let counter =  getCounter() // rest of thing we are calling in func swift ui



struct SimpleView:View{
    
    var body: some View{
        VStack{
            Button {
                nameShow()
            } label: {
                Text("Click Simple Closure")
            }
            
            Button {
                greetings("John")
            } label: {
                Text("Closure with single Argument")
            }
            
            Button {
              jointTwoName("John","Doe")
            } label: {
                Text("Closure with Argument")
            }
            
            
            Button {
           let sum = getSum3(10,5)
                print("Total: \(sum)")
            } label: {
                Text("Closure with Return")
            }
            
            Button {
           let sum = getSum3(10,5)
                print("Total: \(sum)")
            } label: {
                Text("Closure as Function Prams")
            }
            
            Button {
                //Option 1
              /*  doMathWith(a: 4, b: 5, PrintResult: { result in print("Result:\(result)")})*/
                
                //Option 2
              /*  doMathWith(a: 10, b: 20) { result in
                    print("Your result is: \(result)")
                }*/
                
                
                //Option 3
                doMathWith(a: 3, b: 9) { print("Result:\($0)") }
                
            }label: {
                Text("Closures with function")
            }
            
            
            Button {
                SayHello(name: "John Doe") { name in
                    print("Hi! name");
                }
            } label: {
                Text("Closure as Escapping")
            }
            
            
            Button {
               let trainClosure = getTrainName(train: "Purva")
                trainClosure()
            } label: {
                Text("Func return Closures")
            }
            
            
            Button {
             
               counter()
            } label: {
                Text("Closures capture Value")
            }
            
            


            VStack{
                
                Button {
                 
                    nonEscappingClosures {
                        print("Completion called")
                        
                    }
                } label: {
                    Text("Non Escapping Check")
                }
                
                Button {
                 
                    escappingClosures {
                        print("Completion called")
//                        (0...10000).forEach { val in
//                            print("\(val)")
//                        }
                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                            print("After 10 min called")
//                        }
                        
                     /*   DispatchQueue.main.async{
                            
                            print("Escapping call :) ")
                            
//                                                    (0...10000).forEach { val in
//                                                        print("\(val)")
//                                                    }
                        }  */
                        
                    }
                } label: {
                    Text("Escapping Check")
                }
                
            }


        }
    }
}

*/
//PlaygroundPage.current.setLiveView(SimpleView())






