# Profit Spitter
----
![Smart Contracts Handshake](https://research.aimultiple.com/wp-content/uploads/2020/05/smart-contract-featured-image.png)
## Introduction
----
The point of these three contracts is to prove my own, and the smart contracts ability to execute code based on conditions. To reduce friction in the current financial system and give more power and freedom to the user. I believe that the general financial landscape is going to look unrecognisable in the next few decades and that blockchain technology powered by web3 will be the driver. 

----
## ~`AssociateProfitSplitter.sol`~
![Associate Profit Splitter](gifs/AssociateProfitSplitter.gif)
This contract simply takes in payment in Ether and splits it evenly between the specified addresses. 

The contract:

- Contains a constructor that requires three addresses when deployed
- Has a deposit function that can be used to deposit X amount of Ether into the contract
- The deposit function then splits the Ether evenly between the three addresses
- Sends the tiny amount of wei remaining from the split back to the address that originally deposited

It would be a handy contract to use for business owners where profits need to be split evenly.

----

## ~`TieredProfitSplitter.sol`~
![Tiered Profit Splitter](gifs/TieredProfitSplitter.gif)
This contract takes in payment in Ether and splits it between three addresses at tiered rates. 65% for the CEO, 25% for the CTO and 15% for a regular employee like Bob. 

The contract:

- Contains a constructor that requires three addresses when deployed
- Contains a deposit function 
- Splits the Ether deposited between the three addresses according to the relevant split percentages
- Sends the tiny amount of Wei leftover back to the CEO (Cheeky)

The split percentages are currently hardcoded but you could easily add placeholders in the constructor for the percentages to be specified when deployed. This would be a good contract to use for an employee bonus system. Deploy the contract with the relevant percentages --> deposit the total value of bonuses into the contract --> Voila, the employee's all receive their bonuses.

----

## ~`DeferredEquityPlan.sol`~
![Deferred Equity Plan](gifs/DeferredEquityPlan.gif)
This contract is a way of executing an employee's four year vesting schedule on the blockchain.

The contract:

- Takes in one address upon deployment
- Has a timelock that won't let the user claim their first lot of tokens until 365 days have passed
- After the required time, the user can claim their first years tokens and the contract automatically adds another 365 days to the timelock
- Keeps track of all tokens distributed. After all four lots of tokens have been claimed over four years, the contract will know that there are no more tokens to give and will issue a warning if the user tries to claim again.
- Has a deactivate function to be used after all tokens have been claimed

For the purpose of testing I have implemented a `fakeNow` variable to replace all instances of `now` to do with the timelock. The `fastForward` function adds 366 days to `fakeNow` in order to bypass the timelock.

----

## Kovan testnet contract addresses

`AssociateProfitSplitter.sol` - 0x80ae237b3ddcf6023495507d325844e7b0f18f26
`TieredProfitSplitter.sol` - 0xEBff027Db3d1B91B0fb355C78B9aE4Cb20d95220
`FastForward_DeferredEquityPlan.sol` - 0x887122aF982157414C217383F7F72e8Df07E94bC
`DeferredEquityPlan.sol` - 0x8BCACc8E4D577353D55AA5b279C3743bCAa4673E