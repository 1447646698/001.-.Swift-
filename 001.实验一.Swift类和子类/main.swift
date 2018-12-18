//
//  main.swift
//  001.实验一.Swift类和子类
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 李潘. All rights reserved.
//


//Person的性别类型
enum Gender: Int{
    case male = 1
    case female = 0
    //用于后面排序时的gender的比较
    static func >(gender1:Gender,gender2:Gender) -> Bool {
        
        return gender1.rawValue > gender2.rawValue
        
    }
}
//Person类
class Person: CustomStringConvertible{
    var firstName: String    //姓
    var lastName: String    //名
    var age: Int        //年龄
    var gender: Gender        //性别
    var fullName: String {    //姓名
        get{
            return firstName+lastName //全名
        }
    }
    //构造函数
    init(firstName: String,lastName: String,age: Int,gender: Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    //便利构造函数，年龄可以忽略
    convenience init(firstName: String,lastName: String,gender: Gender){
        self.init(firstName: firstName,lastName: lastName,age:0,gender: gender)
    }
    //便利构造函数，无参
    //重载==，使实例可以比较
    static func ==(leftOne: Person,rightOne: Person) ->   Bool{
        return  leftOne.fullName == rightOne.fullName && leftOne.age == rightOne.age && leftOne.gender == rightOne.gender
    }
    //重载!= 使实例可以比较
    static func !=(leftOne: Person,rightOne: Person) ->Bool{
        return !(leftOne == rightOne)
    }
    //实现CustomStringConvertible协议中的计算属性,print（obj）可直接输出内容
    var description: String {
        return "fullName:  \(self.fullName),    age:  \(self.age),    gender:  \(self.gender)"
    }
}

//------从Person派生的Teacher类------------
class Teacher: Person {
    var title: String
    //构造函数
    init(title: String,firstName: String,lastName: String,age: Int,gender: Gender){
        self.title = title
        super.init(firstName: firstName,lastName: lastName,age:age,gender: gender)
    }
    //实现CustomStringConvertible协议中的计算属性,print（obj）可直接输出内容
    override var description: String {
        return "title:  \(self.title),   fullName:  \(self.fullName),    age:  \(self.age),    gender:  \(self.gender)"
    }
}
//------从Person派生的Student类------------
class Student: Person {
    var stuNo: String
    //构造函数
    init(stuNo: String,firstName: String,lastName: String,age: Int,gender: Gender){
        self.stuNo = stuNo
        super.init(firstName: firstName,lastName: lastName,age:age,gender: gender)
    }
    //实现CustomStringConvertible协议中的计算属性,print（obj）可直接输出内容
    override var description: String {
        return "stuNo:  \(self.stuNo),   fullName:  \(self.fullName),   age:  \(self.age),   gender:  \(self.gender)"
    }
}
//--------------实例-----------------------------------
//用于存实例的数组
var objects = [Person]()

//---Person实例---
let persion1 = Person(firstName: "L",lastName: "p",age: 20,gender:  .male )
let persion2 = Person(firstName: "L",lastName: "p",age: 20,gender:  .male )
let persion3 = Person(firstName: "L",lastName: "w",age: 22,gender:  .female )
print("----------------Person实例 输出和比较---------------------------")

print("persion1: ",persion1)
print("persion1 == persion2 ? : ",persion1 == persion2 )
print("persion1 != persion3 ? : ",persion1 != persion3 )
//---Teacher实例---
let teacher1 = Teacher(title:"hello!",firstName: "邓",lastName: "礼",age: 30,gender:  .female)
let teacher2 = Teacher(title:"hi!",firstName: "牛",lastName: "茶",age: 40,gender:  .male)
let teacher3 = Teacher(title:"HHH!",firstName: "文",lastName: "梓",age: 20,gender:  .female)
print("----------------Teacher实例 输出和比较---------------------------")

print("teacher1: ",teacher1)
print("teacher1 == teacher2 ? : ",teacher1 == teacher2)
print("teacher1 != teacher2 ? : ",teacher1 != teacher2)

//---Student实例---
let student1 = Student(stuNo:"001",firstName: "艾",lastName: "倪",age: 18,gender:  .female)
let student2 = Student(stuNo:"002",firstName: "项",lastName: "励",age: 20,gender:  .male)
let student3 = Student(stuNo:"003",firstName: "秦",lastName: "峰",age: 22,gender:  .male)
print("----------------Student实例 输出和比较---------------------------")

print("student1: ",student1)
print("student1 == student2 ? : ",student1 == student2)
print("student1 == student2 ? : ",student1 != student2)
//将所有实例保存到数组
objects.append(persion1)
objects.append(persion2)
objects.append(persion3)
objects.append(teacher1)
objects.append(teacher2)
objects.append(teacher3)
objects.append(student1)
objects.append(student2)
objects.append(student3)
//输出保存的实例
print("------------输出所有实例-------------------")

for allBbjets in objects {
    print(allBbjets)
}
//定义字典
var objectAndNum = ["Person":0,"Teacher":0,"Student":0]
//统计同类的个数
for objectType in objects{
    if objectType is Teacher{
        objectAndNum["Teacher"]! += 1
    }
    else if objectType is Student{
        objectAndNum["Student"]! += 1
    }
    else {
        objectAndNum["Person"]! += 1
    }
}
for (key,value) in objectAndNum{
    print("\(key) 有\(value)个")
}

print("------------所有实例按年龄从小到大排序-------------------")

objects.sort {return $0.age < $1.age }

for allBbjets in objects {
    
    print(allBbjets)
    
}


print("------------所有实例按名字排序-------------------")
objects.sort {return $0.fullName < $1.fullName }

for allBbjets in objects {
    
    print(allBbjets)
    
}

print("------------所有实例按年龄性别排序-------------------")
objects.sort {return ($0.age < $1.age) && ($0.gender > $1.gender) }

for allBbjets in objects {
    
    print(allBbjets)
    
}

