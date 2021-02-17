{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "pragma solidity ^0.5.0;\n",
    "\n",
    "\n",
    "// level 1: equal split \n",
    "\n",
    "contract AssociateProfitSplitter {\n",
    "    address payable employee_one = 0x8d4B10369ccC3E1642E581C1b8417c548F54a727;\n",
    "    address payable employee_two = 0xCE18A2f39BCd1cb2eB9a6Bf9F8454D207F04bc10;\n",
    "    address payable employee_three = 0x9f5c979053b2b867457ef26440426889bC369fb2;\n",
    "    \n",
    "    constructor(address payable _one, address payable _two, address payable _three) public {\n",
    "        employee_one = _one;\n",
    "        employee_two = _two;\n",
    "        employee_three = _three;\n",
    "    }\n",
    "    \n",
    "    function balance() public view returns(uint) {\n",
    "        return address(this).balance;\n",
    "    }\n",
    "    \n",
    "    function deposit() public payable {\n",
    "        // split msg.value into three\n",
    "        uint amount = msg.value / 3;\n",
    "        \n",
    "        // transfer the amount to each employee \n",
    "        employee_one.transfer(amount);\n",
    "        employee_two.transfer(amount);\n",
    "        employee_three.transfer(amount);\n",
    "        \n",
    "        // take care of a potential remainder by sending back to HR (msg.sender)\n",
    "        msg.sender.transfer(msg.value - (amount * 3) );\n",
    "    }\n",
    "    \n",
    "    function() external payable {\n",
    "        // enforce that the deposit function is called in the fallback function\n",
    "        deposit();\n",
    "    }\n",
    "}\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
