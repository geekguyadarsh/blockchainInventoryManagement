 // SPDX-License-Identifier: GPL-3.
 pragma solidity ^0.5.0;

 contract supplychain {
    
     struct veggies{
         int good;
         int bad;
         int price;
         int tveggies;
         int net_price;
         int pnl;
     }

     veggies tomato;
     veggies potato;
     veggies carrot;
     veggies brinjal;
     veggies cucumber;

    int net_all;
    int pnl_all;
    string veg;

     function calculateProfit (string memory vegetable , int _good , int _bad , int _price) public {
            veg = vegetable;
            if (keccak256(abi.encodePacked(vegetable)) == keccak256(abi.encodePacked("Tomato"))) {
                tomato.good = _good;
                tomato.bad = _bad;
                tomato.price = _price;
                tomato.tveggies = tomato.good + tomato.bad;
                tomato.net_price = tomato.tveggies * _price;
                tomato.pnl = ( tomato.good * (tomato.price+20) ) - tomato.net_price;
            }
            
            else if (keccak256(abi.encodePacked(vegetable)) == keccak256(abi.encodePacked("Potato"))){
                potato.good = _good;
                potato.bad = _bad;
                potato.price = _price;
                potato.tveggies = potato.good + potato.bad;
                potato.net_price = potato.tveggies * _price;
                potato.pnl = ( potato.good * (potato.price+20) ) - potato.net_price ;
            }

            else if (keccak256(abi.encodePacked(vegetable)) == keccak256(abi.encodePacked("Carrot"))) {
                carrot.good = _good;
                carrot.bad = _bad;
                carrot.price = _price;
                carrot.tveggies = carrot.good + carrot.bad;
                carrot.net_price = carrot.tveggies * _price;
                carrot.pnl =  ( carrot.good * (carrot.price+20) ) - carrot.net_price;
            }

            else if (keccak256(abi.encodePacked(vegetable)) == keccak256(abi.encodePacked("Brinjal"))) {
                brinjal.good = _good;
                brinjal.bad = _bad;
                brinjal.price = _price;
                brinjal.tveggies = brinjal.good + brinjal.bad;
                brinjal.net_price = brinjal.tveggies * _price;
                brinjal.pnl = ( brinjal.good * (brinjal.price+20) ) - brinjal.net_price ;
            }

            else if (keccak256(abi.encodePacked(vegetable)) == keccak256(abi.encodePacked("Cucumber"))) {
                cucumber.good = _good;
                cucumber.bad = _bad;
                cucumber.price = _price;
                cucumber.tveggies = cucumber.good + cucumber.bad;
                cucumber.net_price = cucumber.tveggies * _price;
                cucumber.pnl = ( cucumber.good * (cucumber.price+20) ) - cucumber.net_price;
            }

            net_all = tomato.net_price + potato.net_price + carrot.net_price + brinjal.net_price + cucumber.net_price;
            pnl_all = tomato.pnl + potato.pnl + carrot.pnl + brinjal.pnl + cucumber.pnl;
     }


     function netVeggie() public view returns (int) {
            if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Tomato"))) {
                return (tomato.net_price);
            }
            
            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Potato"))){
                return (potato.net_price);
            }

            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Carrot"))) {
                return (carrot.net_price);
            }

            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Brinjal"))) {
                return (brinjal.net_price);
            }

            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Cucumber"))) {
                return (cucumber.net_price);
            }
     }

     function pnlVeggie() public view returns (int) {
         if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Tomato"))) {
                return (tomato.pnl);
            }
            
            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Potato"))){
                return (potato.pnl);
            }

            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Carrot"))) {
                return (carrot.pnl);
            }

            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Brinjal"))) {
                return (brinjal.pnl);
            }

            else if (keccak256(abi.encodePacked(veg)) == keccak256(abi.encodePacked("Cucumber"))) {
                return (cucumber.pnl);
            }
     }

     function netAllVeggie() public view returns (int) {
         return (net_all);
     }

     function pnlAllVeggie() public view returns (int) {
         return (pnl_all);
     }
     function totalVeggies() public view returns(int){
         return(tomato.good+tomato.bad+potato.good+potato.bad+carrot.good+carrot.bad+brinjal.good+brinjal.bad+cucumber.good+cucumber.bad);
     }
 }