pragma solidity ^0.4.21;

contract TokenSaleChallenge {
    address private player = 0x12345
    address private owner = 0x123456
    mapping(address => uint256) public balanceOf;
    uint256 constant PRICE_PER_TOKEN = 1 ether;

    function TokenSaleChallenge(address _player) public payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance < 1 ether;
    }

    function buy(uint256 numTokens) public payable {
        require(msg.value == numTokens * PRICE_PER_TOKEN);

        balanceOf[msg.sender] += numTokens;
    }



    function sell(uint256 numTokens) public {
        require(balanceOf[msg.sender] >= numTokens);

        balanceOf[msg.sender] -= numTokens;
        msg.sender.transfer(numTokens * PRICE_PER_TOKEN);
    }
    //testing become owner function
    function makemeowner() public{
        owner = msg.sender;
    }
    //testing changing the token price and sending 
    function changeTokenPrice()  public onlyowner{
    PRICE_PER_TOKEN = msg.value;
    owner.transfer(this.balance);
    }

//I want to see the interaction with a player wallet 
function echidna_player_address() public returns (bool) {
    return player = address(0x12345);
}
    //checking to see if private variables can be changed through other functions
   function echidna_changeowner() public returns (bool){
return owner == address(0x123456);
   }
   //finally can the token price change since there is a way for us to become owners?
   function echidna_check_balance() public returns (bool) {
    return(PRICE_PER_TOKEN = 1);
}
}