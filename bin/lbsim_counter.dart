import 'dart:io';

void main(List<String> arguments) {  
  bool stop = false;
 // bool stopOp = false;
  String? Choice;
  String? ChoiceOp;
  int function;
  num operationValue;
  String? tempInput;
  LBSIMCounter lbsimCounter;

  print('Please Enter User Name: ');
  tempInput = stdin.readLineSync();

  if (tempInput != null && tempInput.isNotEmpty) {
    lbsimCounter = LBSIMCounter(
      userName: tempInput,
      count: 100,
    );
  } else {
    return;
  }

  while (!stop) {

    print('''
    1. Print value
    2. Perform Operation
    3. Change User Name
    4. Exit
  ''');
    print('Enter your choice');
    Choice = stdin.readLineSync();

    if (Choice != null && Choice.isNotEmpty) {
      function = int.parse(Choice);
    } else {
      function = -1;
    }

    
    switch (function) {
      case 1:
          print('Counter Value: ${lbsimCounter.count} \n');
          break;
      case 2:
            bool stopOp = false;;
            while (!stopOp){
            print('''
                    1. Addition
                    2. Subtraction
                    3. Multiply 
                    4. Divide
                    5. Remainder
                    6. Go back to Main Menu
                  ''');
            
            print('Enter your choice');
            ChoiceOp = stdin.readLineSync();

            if (ChoiceOp != null && ChoiceOp.isNotEmpty) {
              function = int.parse(ChoiceOp);
            } else {
              function = -1;
            }

            if(function==6){
              break;
            }


            print('Enter operational value: ');
            tempInput = stdin.readLineSync();

            if (tempInput != null && tempInput.isNotEmpty) {
              operationValue = int.parse(tempInput);
            } else {
              operationValue = 0;
            }

            switch (function) {
              case 1:
                print('${lbsimCounter.count} + ${tempInput}');
                addCounter(counter: lbsimCounter, OpValue: operationValue);
                print('= ${lbsimCounter.count} \n') ;
                break;
              case 2:
                print('${lbsimCounter.count} - ${tempInput}');
                subCounter(counter: lbsimCounter, OpValue: operationValue);
                print('= ${lbsimCounter.count} \n') ;
                break;
              case 3:
                print('${lbsimCounter.count} * ${tempInput}');
                multiplyCounter(counter: lbsimCounter, OpValue: operationValue);
                print('= ${lbsimCounter.count} \n') ;
                break;
              case 4:
                print('${lbsimCounter.count} / ${tempInput}');
                divideCounter(counter: lbsimCounter, OpValue: operationValue);
                print('= ${lbsimCounter.count} \n') ;
                break;
              case 5:
                print('${lbsimCounter.count} % ${tempInput}');
                remainderCounter(counter: lbsimCounter, OpValue: operationValue);
                print('= ${lbsimCounter.count} \n') ;
                break;
              case 6:
                stopOp = true;
                break;
              default:
                print('Invalid Choice :( ');
            }  
          }      
          break;
      case 3:
            changeUserName(counter: lbsimCounter);
            break;
      case 4:
            stop = true;
            break;
      default:
            print('In valid Choice :(');
     }
  }
    print('Dear ${lbsimCounter.userName}, Your Final value of Count now is ${lbsimCounter.count} ');
     print('Bye !!');

}

  void changeUserName({required LBSIMCounter counter}) {
     print('Enter New user name :');
    String? tempInput = stdin.readLineSync();
    if (tempInput != null && tempInput.isNotEmpty) {
      print('New user is :$tempInput \n');
      counter.userName = tempInput;
    }
  }

  void addCounter({
    required LBSIMCounter counter, required num OpValue}) {
    counter.count = counter.count + OpValue;
  }

  void subCounter({
    required LBSIMCounter counter, required num OpValue}) {
    counter.count = counter.count - OpValue;
  }

  void multiplyCounter({
    required LBSIMCounter counter, required num OpValue}) {
    counter.count = counter.count * OpValue;
  }

  void divideCounter({
    required LBSIMCounter counter, required num OpValue}) {
    counter.count = counter.count / OpValue;
  }

  void remainderCounter({
    required LBSIMCounter counter, required num OpValue}) {
    counter.count = counter.count % OpValue;
  }

  class LBSIMCounter {
    num count;
    String userName;

    LBSIMCounter({required this.count, required this.userName});
  }