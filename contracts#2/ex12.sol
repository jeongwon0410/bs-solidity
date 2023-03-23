pragma solidity 0.8.12;
// 자동차의 상태(enum 변수)는 turnedOff, turnOn, Stop, Driving, outOfGas로 구성되어 있습니다.
// 자동차는 이름, 연료량(uint) 그리고 상태로 구성되어 있는 구조체입니다.

// 시작할 때 자동차의 이름은 input으로 받고 상태는 tunredOff를 기본으로 한다.(constructor)

// 차 정보 받아오기 기능을 구현하세요. 
// 차 시동을 거는 기능, 정지하는 기능을 구현하세요. 

// 차를 운전하는 기능을 구현하세요. 운전을 하면 연료가 1만큼 감소합니다.
// 연료가 일정 수준이하(3)로 떨어지게 되면 운전을 할 수 없습니다.

// 연료를 충전하는 기능을 구현하세요. 최소 1이더를 넣어야 합니다. (나머지는 버림해도 좋습니다)
// 연료는 1이더당 10만큼 충전됩니다.
contract AAA {
    enum Status {turnedOff, turnedOn, stop, driving, outOfGas}

    struct Car {
        string name;
        uint volume;
        Status status;
    }
    Car car;

    constructor(string memory _name){
        car.name = _name;
        car.status = Status.turnedOff; 
    }

    function getCar() public view returns(Car memory) {
        return car;
    }

    function turnOnCar() public {
        require(car.status == Status.turnedOff);
        car.status = Status.turnedOn;
    }

    function drivingCar() public {
        require(car.volume > 3 && car.status == Status.turnedOn);
        car.status = Status.driving;
        car.volume--;
    }

    function stopCar() public {
        car.status = Status.stop;
    }
//10**18
    function chargeCar() public payable {
        require(msg.value>=1000000000000000000);
        uint bal = address(this).balance/1000000000000000000;
        car.volume += bal*10;


    }


}