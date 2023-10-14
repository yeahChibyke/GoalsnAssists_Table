## Foundry

**GoalsnAssists_Table is a smart contract that enables users to store names of footballers, the number of goals they have scored, the number of assists they have made, etc.**

GoalsnAssists_Table contains:

-   **Player**: Struct that contains elements for details input.
-   **listOfPlayers**: Public array that will contain list of players and their details.
-   **nameToGoals**: Public mapping of name of player to goals scored.
-   **nameToAssists**: Public mapping of name of player to assists made

## Documentation

https://book.getfoundry.sh/

## Functions

### addPlayer()

```    
    function addPlayer(string memory _name, string memory _club, string memory _position, uint256    _goals, uint256 _assists, uint256 _matches) 
            public {
                listOfPlayers.push(Player(_name, _club, _position, _goals, _assists, _matches));
                nameToGoals[_name] = _goals;
                nameToAssists[_name] = _assists;
            }
```

### totalNumberOfPlayers()

```
    function totalNumberOfPlayers() public view returns(uint256) {
        uint256 numberOfPlayers = listOfPlayers.length;
        return numberOfPlayers;
    }
```

### removePlayer()

```
    function removePlayer(string memory _name) public {
        require(listOfPlayers.length > 0, "There are no players in the list");
        uint256 playerIndex = 0;
        while(playerIndex < listOfPlayers.length && keccak256(abi.encodePacked(listOfPlayers[playerIndex].name)) != keccak256(abi.encodePacked(_name))) {
            playerIndex++;
        }
        require(playerIndex < listOfPlayers.length, "Player not found");
        listOfPlayers[playerIndex] = listOfPlayers[listOfPlayers.length - 1];
        listOfPlayers.pop();
        delete nameToGoals[_name];
        delete nameToAssists[_name];
    }
```

### getTopScorer()

```
    function getTopScorer() public view returns(string memory topScorer, uint256 topScore) {
        for(uint256 i = 0; i < listOfPlayers.length; i++) {
            if(listOfPlayers[i].goals > topScore) {
                topScorer = listOfPlayers[i].name;
                topScore = listOfPlayers[i].goals;
            }
        }
        return (topScorer, topScore);
    }
```

### getTopAssister()

```
    function getTopAssister() public view returns(string memory topAssister, uint256 topAssist) {
        for(uint256 i = 0; i < listOfPlayers.length; i++) {
            if(listOfPlayers[i].assists > topAssist) {
                topAssister = listOfPlayers[i].name;
                topAssist = listOfPlayers[i].assists;
            }
        }
        return (topAssister, topAssist);
    }
```
